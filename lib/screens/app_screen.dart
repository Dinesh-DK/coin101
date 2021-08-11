import 'package:coin_101/screens/landing_page.dart';
import 'package:flutter/material.dart';

import 'market_page.dart';
import 'watchlist_page.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coin 101'),
          titleSpacing: 10,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/app_logo.png'),
          ),
        ),
        bottomNavigationBar: Container(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    showPage(0);
                  },
                  icon: Icon(Icons.public)),
              IconButton(
                  onPressed: () {
                    showPage(1);
                  },
                  icon: Icon(Icons.view_list_sharp)),
              IconButton(
                  onPressed: () {
                    showPage(2);
                  },
                  icon: Icon(Icons.money))
            ],
          ),
          color: Theme.of(context).primaryColor,
          height: 50,
        ),
        body: PageView(
          controller: _pageController,
          children: [
            LandingPage(),
            WatchlistPage(),
            MarketPage(),
          ],
        ));
  }

  showPage(int pageNo) {
    _pageController.animateToPage(pageNo,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
