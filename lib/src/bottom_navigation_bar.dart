import 'package:ecomerce_movil/src/pages/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_movil/src/pages/account/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerce_movil/src/pages/home_page.dart';
import 'package:ecomerce_movil/src/pages/brand/brand_page.dart';
import 'package:ecomerce_movil/src/pages/cart/cart_page.dart';

class ButtomNavigationBar extends StatefulWidget {
  @override
  _ButtomNavigationBarState createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new HomePage();
        break;
      // case 1:
      //   return new BrandPage();
      //   break;
      // case 2:
      //   return new CartPage();
      //   break;
      // case 3:
      //   return new ProfilePage();
      //   break;
      // default:
      //   return Menu();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption:
                        TextStyle(color: Colors.black26.withOpacity(0.15)))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: Color(0xFF6991C7),
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 23.0,
                    ),
                    title: Text(
                      AppLocalizations.of(context).tr('home'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    title: Text(
                      AppLocalizations.of(context).tr('brand'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text(
                      AppLocalizations.of(context).tr('cart'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    title: Text(
                      AppLocalizations.of(context).tr('account'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
              ],
            )),
      ),
    );
  }
}
