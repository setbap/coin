import 'package:bloc/bloc.dart';
import 'package:bloc_header/data/models/coin_list_item.dart';
import 'package:bloc_header/data/repositories/coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'coin_list_state.dart';

class CoinListCubit extends Cubit<CoinListState> {
  final CoinDataRespository _dataRespository;
  CoinListCubit()
      : this._dataRespository = CoinDataRespository(),
        super(CoinListLoading());

  getList() async {
    emit(CoinListLoading());
    try {
      var coinList = await _dataRespository.getCoinList();
      emit(CoinListData(dataList: coinList));
    } catch (e) {
      print(e);
      emit(CoinListError("errorMessage"));
    }
  }
}
