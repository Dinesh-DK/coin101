import 'dart:convert';

import 'package:coin_101/models/coin.dart';
import 'package:coin_101/models/coin_info.dart';
import 'package:coin_101/models/event.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();

  static const String API_URL = 'https://api.coingecko.com/api/v3/',
      trendsPath = 'search/trending',
      eventsPath = 'events';

  static ApiServices? _instance;

  static late http.Client client;

  static ApiServices get instance {
    if (_instance == null) {
      _instance = ApiServices._();
    }
    return _instance!;
  }

  Future<List<Coin>?> getTrendingCoins() async {
    client = http.Client();
    final response = await client.get(Uri.parse(API_URL + trendsPath));
    if (response.statusCode == 200) {
      List<Coin> list = <Coin>[];
      List trendingMap = json.decode(response.body)["coins"];
      trendingMap.forEach((element) {
        list.add(Coin.fromJson(element["item"]));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<List<Event>?> getCryptoEvents() async {
    client = http.Client();
    final response = await client.get(Uri.parse(API_URL + 'events'));
    List<Event> events = <Event>[];
    if (response.statusCode == 200) {
      final List eventJson = json.decode(response.body)["data"];
      eventJson.forEach((element) {
        events.add(Event.fromJson(element));
      });
      return events;
    } else {
      return null;
    }
  }

  Future<List<CoinInfo>?> getCoins(int pageCount, int pageNo) async {
    client = http.Client();
    final response = await client.get(Uri.parse(API_URL +
        'coins/markets?vs_currency=inr&per_page=$pageCount&page=$pageNo'));
    if (response.statusCode == 200) {
      List<CoinInfo> list = <CoinInfo>[];
      List trendingMap = json.decode(response.body);
      trendingMap.forEach((element) {
        list.add(CoinInfo.fromJson(element));
      });
      return list;
    } else {
      return null;
    }
  }

  Future<CoinInfo?> getCoinInfo(String coinId) async {
    client = http.Client();
    final response = await client
        .get(Uri.parse(API_URL + 'coins/markets?vs_currency=inr&ids=$coinId'));
    if (response.statusCode == 200) {
      return CoinInfo.fromJson(json.decode(response.body)[0]);
    } else {
      return null;
    }
  }
}
