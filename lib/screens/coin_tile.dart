import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_101/models/coin_info.dart';
import 'package:flutter/material.dart';

class CoinTile extends ListTile {
  CoinTile(CoinInfo coinInfo, Size size, bool needRank, BuildContext context)
      : super(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: coinInfo.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Text(
            coinInfo.name,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('Price: ₹${coinInfo.currentPrice}'),
          trailing: SizedBox(
            width: size.width / 4,
            child: Row(
              children: [
                if (needRank)
                  Text(
                    ' '+coinInfo.marketCapRank.toString() +' ',
                    style: TextStyle(
                        backgroundColor: Theme.of(context).primaryColor),
                  ),
                if (needRank) Spacer(),
                Text(coinInfo.symbol.toUpperCase()),
                Spacer(),
                Column(children: [
                  coinInfo.priceChangePercentage24H < 0
                      ? Icon(
                          Icons.trending_down,
                          color: Colors.red,
                        )
                      : Icon(Icons.trending_up, color: Colors.green),
                  Text('${coinInfo.priceChangePercentage24H.round()}%')
                ]),
              ],
            ),
          ),
        );
}
