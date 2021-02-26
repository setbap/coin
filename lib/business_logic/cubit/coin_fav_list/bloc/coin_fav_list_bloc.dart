import 'dart:async';
import 'dart:convert';

import 'package:bloc_header/data/models/coin_detail.dart';
import 'package:bloc_header/data/models/coin_list_item.dart';
import 'package:bloc_header/data/repositories/coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'coin_fav_list_event.dart';
part 'coin_fav_list_state.dart';

class CoinFavListBloc extends HydratedBloc<CoinFavListEvent, CoinFavListState> {
  final CoinDataRespository _coinDataRespository;
  CoinFavListBloc()
      : _coinDataRespository = CoinDataRespository(),
        super(
          CoinFavListState(
            dataList: [],
            errorMessage: "",
            isLoading: false,
            lastUpdate: DateTime.now(),
          ),
        );

  @override
  Stream<CoinFavListState> mapEventToState(
    CoinFavListEvent event,
  ) async* {
    if (event is CoinFavListToggleItem) {
      yield state.copyWith(isLoading: true);
      int itemIndex =
          state.dataList.indexWhere((element) => element.id == event.coin.id);
      if (itemIndex != -1) {
        yield state.copyWith(
          dataList: state.dataList
              .where(
                (element) => element.id != event.coin.id,
              )
              .toList(),
          isLoading: false,
        );
        return;
      } else {
        try {
          var item = await _coinDataRespository.getCoinDetail(event.coin);
          yield state.copyWith(
              dataList: [item, ...state.dataList],
              isLoading: false,
              lastUpdate: DateTime.now());
        } catch (e) {
          state.copyWith(
            errorMessage: "error in toggling coin",
            isLoading: false,
            lastUpdate: DateTime.now(),
          );
        }
      }
    }
  }

  @override
  CoinFavListState fromJson(Map<String, dynamic> json) =>
      CoinFavListState.fromMap(json);

  @override
  Map<String, dynamic> toJson(CoinFavListState state) => state.toMap();
}
