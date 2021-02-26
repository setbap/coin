import 'dart:convert';
import 'package:bloc_header/data/models/coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDataApi {
  final http.Client clinet;

  CoinDataApi({@required this.clinet});

  Future<List<dynamic>> getCoinList() async {
    var response =
        await clinet.get("https://api.coingecko.com/api/v3/coins/list");
    if (response.statusCode < 300) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      print("error in request");
      throw "Can't get List.";
    }
  }

  Future<Map<String, dynamic>> getCoinDetail(String coinId) async {
    var response = await clinet.get(
        "https://api.coingecko.com/api/v3/simple/price?ids=$coinId&vs_currencies=$BasePrice&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true&include_last_updated_at=true");
    if (response.statusCode < 300) {
      return (json.decode(response.body) as Map<String, dynamic>)[coinId];
    } else {
      print("error in request");
      throw "Can't get List.";
    }
  }
}
