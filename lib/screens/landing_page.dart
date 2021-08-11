import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_101/models/coin.dart';
import 'package:coin_101/models/coin_info.dart';
import 'package:coin_101/models/event.dart';
import 'package:coin_101/screens/coin_tile.dart';
import 'package:coin_101/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TrendsCard(),
            EventsCard(),
          ],
        ),
      ),
    );
  }
}

class EventsCard extends StatelessWidget {
  const EventsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiServices>(context);
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<Event>?>(
        future: api.getCryptoEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Text("Can't fetch events"),
            );
          }
          return Container(
            width: size.width,
            child: Card(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: getEventWidgets(snapshot.data!, size),
                  ),
                ),
              ),
            ),
          );
        });
  }

  getEventWidgets(List<Event> eventList, Size size) {
    List<Widget> list = <Widget>[];
    eventList.forEach((event) {
      list.add(Card(
          child: ElevatedButton(
        onPressed: () {},
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                event.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Row(
                children: [
                  Icon(Icons.today),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Text(event.startDate.toString().substring(0, 10)),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Flexible(
                      child: Text(
                    event.address,
                  )),
                ],
              ),
            ],
          ),
        ),
      )));
    });

    return list;
  }
}

class TrendsCard extends StatelessWidget {
  const TrendsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiServices>(context);
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<Coin>?>(
        future: api.getTrendingCoins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Text("Can't fetch events"),
            );
          }
          return Container(
            width: size.width,
            child: Card(
              color: Colors.lightGreen[400],
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.lerp(
                          Alignment.centerLeft, Alignment.center, 0.1),
                      child: Text('Trending Coins',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900))),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                          children: getTrendItems(snapshot.data!, api,
                              MediaQuery.of(context).size)),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  getTrendItems(List<Coin> trends, ApiServices api, Size size) {
    final list = <Widget>[];
    trends.forEach((trend) {
      list.add(
        Card(
          child: FutureBuilder<CoinInfo?>(
              future: api.getCoinInfo(trend.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data == null) {
                  return Center(
                    child: Text("Can't fetch latest trends"),
                  );
                }
                CoinInfo coinInfo = snapshot.data!;
                return CoinTile(coinInfo, size, false, context);
              }),
        ),
      );
    });

    return list;
  }
}
