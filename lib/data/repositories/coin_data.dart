import 'package:bloc_header/data/data_provider/coin_data.dart';
import 'package:bloc_header/data/models/coin_detail.dart';
import 'package:bloc_header/data/models/coin_list_item.dart';
import 'package:http/http.dart' as http;

class CoinDataRespository {
  final CoinDataApi coinDataApi;

  CoinDataRespository() : this.coinDataApi = CoinDataApi(clinet: http.Client());

  Future<List<CoinListItem>> getCoinList() async {
    try {
      List<dynamic> rawData = await coinDataApi.getCoinList();
      return rawData.map((rawItem) => CoinListItem.fromMap(rawItem)).toList();
    } catch (error) {
      print("error");
      print(error);

      throw error.toString();
    }
  }

  Future<CoinDetail> getCoinDetail(CoinListItem coin) async {
    try {
      Map<String, dynamic> rawData = await coinDataApi.getCoinDetail(coin.id);
      rawData['id'] = coin.id;
      rawData['symbol'] = coin.symbol;
      rawData['name'] = coin.name;
      print(rawData);
      return CoinDetail.fromMap(rawData);
    } catch (error) {
      print("error in get coin $error");
      throw error.toString();
    }
  }
}
