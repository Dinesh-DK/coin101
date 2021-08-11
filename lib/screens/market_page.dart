import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_101/models/coin_info.dart';
import 'package:coin_101/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coin_tile.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late ApiServices _api;

  late List<CoinInfo>? coinList;

  @override
  void initState() {
    _api = Provider.of(context, listen: false);
    coinList = <CoinInfo>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoinInfo>?>(
        future: _api.getCoins(20, 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Container(child: Center(child: CircularProgressIndicator()));
          coinList = snapshot.data;
          if (coinList == null || coinList!.isEmpty) {
            return Container(
              child: Center(
                child: Text('Check your internet connection'),
              ),
            );
          }
          return Container(
            child: ListView.builder(
                itemCount: coinList!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      CoinTile(coinList![i], MediaQuery.of(context).size, true,context),
                      Divider()
                    ],
                  );
                }),
          );
        });
  }
}
