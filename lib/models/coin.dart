// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));

String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
    Coin({
        required this.id,
        required this.coinId,
        required this.name,
        required this.symbol,
        required this.marketCapRank,
        required this.thumb,
        required this.small,
        required this.large,
        required this.slug,
        required this.priceBtc,
        required this.score,
    });

    String id;
    int coinId;
    String name;
    String symbol;
    int marketCapRank;
    String thumb;
    String small;
    String large;
    String slug;
    double priceBtc;
    int score;

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        coinId: json["coin_id"],
        name: json["name"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
        slug: json["slug"],
        priceBtc: json["price_btc"].toDouble(),
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "coin_id": coinId,
        "name": name,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "small": small,
        "large": large,
        "slug": slug,
        "price_btc": priceBtc,
        "score": score,
    };
}
