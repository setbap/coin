import 'package:bloc/bloc.dart';
import 'package:bloc_header/data/models/coin_detail.dart';
import 'package:bloc_header/data/models/coin_list_item.dart';
import 'package:bloc_header/data/repositories/coin_data.dart';
import 'package:equatable/equatable.dart';

part 'coin_detail_state.dart';

class CoinDetailCubit extends Cubit<CoinDetailState> {
  final CoinDataRespository _dataRespository;
  CoinDetailCubit()
      : this._dataRespository = CoinDataRespository(),
        super(CoinDetailLoading());

  getDetail(CoinListItem coin) async {
    emit(CoinDetailLoading());
    try {
      print("beforerecived data ");
      var coinDetail = await _dataRespository.getCoinDetail(coin);

      emit(CoinDetailData(coinDetail: coinDetail));
    } catch (e) {
      print(e);
      emit(CoinDetailError(e));
    }
  }
}
