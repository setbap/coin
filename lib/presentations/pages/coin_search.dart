import 'package:bloc_header/business_logic/cubit/coin_detail/coin_detail_cubit.dart';
import 'package:bloc_header/business_logic/cubit/coin_fav_list/bloc/coin_fav_list_bloc.dart';
import 'package:bloc_header/business_logic/cubit/coin_list/coin_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinSearchMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoinListCubit>(
          create: (context) => CoinListCubit(),
        ),
        BlocProvider<CoinDetailCubit>(
          create: (context) => CoinDetailCubit(),
        ),
        BlocProvider<CoinFavListBloc>(
          create: (context) => CoinFavListBloc(),
        ),
      ],
      child: CoinSearch(),
    );
  }
}

class CoinSearch extends StatefulWidget {
  @override
  _CoinSearchState createState() => _CoinSearchState();
}

class _CoinSearchState extends State<CoinSearch> {
  TextEditingController _controller = TextEditingController();
  String _text = "";

  void onClickSearch() {
    setState(() {
      _text = _controller.text;
    });
  }

  void getPrice(String coinName) {}

  @override
  void initState() {
    super.initState();
    context.read<CoinListCubit>().getList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinListCubit, CoinListState>(
      builder: (context, state) {
        if (state is CoinListLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CoinListError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "coin Search (error happend)",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: Center(
              child: Text(state.errorMessage),
            ),
          );
        }
        if (state is CoinListData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "coin Search",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.search),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) =>
                                      EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              onPressed: onClickSearch,
                              label: Text("button"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height - 140) / 2,
                    child: BlocBuilder<CoinFavListBloc, CoinFavListState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state.errorMessage.isNotEmpty) {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Hero(
                                  tag: state.dataList[index].id,
                                  child: Text(state.dataList[index].name)),
                            ),
                            itemCount: state.dataList.length,
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height - 140) / 2,
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        subtitle: Hero(
                            tag: state.dataList[index].id,
                            child: Text(state.dataList[index].name)),
                        title: Text(state.dataList[index].symbol),
                        trailing: OutlinedButton.icon(
                            onPressed: () {
                              context.read<CoinFavListBloc>().add(
                                    CoinFavListToggleItem(
                                      state.dataList[index],
                                    ),
                                  );
                            },
                            icon: Icon(
                              index.isOdd
                                  ? Icons.star
                                  : Icons.star_border_rounded,
                            ),
                            label: Text("")),
                        onTap: () {
                          context
                              .read<CoinDetailCubit>()
                              .getDetail(state.dataList[index]);
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Theme.of(context).primaryColor,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                child: BlocBuilder<CoinDetailCubit,
                                    CoinDetailState>(
                                  builder: (context, innerState) {
                                    if (innerState is CoinDetailLoading) {
                                      return Container(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if (innerState is CoinDetailError) {
                                      return Container(
                                        child: Center(
                                          child: Text(innerState.errorMessage),
                                        ),
                                      );
                                    }
                                    if (innerState is CoinDetailData) {
                                      return Container(
                                        child: Center(
                                          child: Text(
                                            innerState.coinDetail.toString(),
                                          ),
                                        ),
                                      );
                                    }

                                    return Container();
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      itemCount: state.dataList.length,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return CircleAvatar(
          child: Text("data"),
        );
      },
    );
  }
}
