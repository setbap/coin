part of 'coin_list_cubit.dart';

abstract class CoinListState extends Equatable {
  const CoinListState();

  @override
  List<Object> get props => [];
}

class CoinListLoading extends CoinListState {}

class CoinListError extends CoinListState {
  final String errorMessage;

  const CoinListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CoinListData extends CoinListState {
  final List<CoinListItem> dataList;

  const CoinListData({@required this.dataList});

  @override
  List<Object> get props => [dataList.length];
}
