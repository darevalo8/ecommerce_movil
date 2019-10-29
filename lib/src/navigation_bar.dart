import 'package:ecomerce_movil/src/pages/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_movil/src/pages/account/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerce_movil/src/pages/home_page.dart';
import 'package:ecomerce_movil/src/pages/brand/brand_page.dart';
import 'package:ecomerce_movil/src/pages/cart/cart_page.dart';

class BtnNavigationBar extends StatefulWidget {
  @override
  _BtnNavigationBarState createState() => _BtnNavigationBarState();
}

class _BtnNavigationBarState extends State<BtnNavigationBar> {
  int _selectedPage = 0;
  final _pageOptions = [Menu(), BrandPage(), CartPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: _navegation(),
    );
  }

  Widget _navegation() {
    return BottomNavigationBar(
      elevation: 20.0,
      currentIndex: _selectedPage,
      selectedItemColor: Colors.pinkAccent[400],
      onTap: (int index) => setState(() {
        _selectedPage = index;
      }),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.0),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 30.0),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 30.0),
          title: Container(),
        ),
      ],
    );
  }
}
