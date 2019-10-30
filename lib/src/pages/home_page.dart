import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:easy_localization/easy_localization_provider.dart';
// import 'package:ecomerce_movil/Library/carousel_pro/src/carousel_pro.dart';
import 'package:ecomerce_movil/src/model/menu_model.dart';
import 'package:ecomerce_movil/src/providers/menu_provider.dart';
import 'package:ecomerce_movil/src/widgets/category_icon_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_movil/ListItem/HomeGridItemRecomended.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/AppbarGradient.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/DetailProduct.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/MenuDetail.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

/// Component all widget in home
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;

  bool isStarted = false;
  var menuProvider = MenuProvider();
  List<Jerarquia> menuList;
  Widget menu;
  void holaMundo() {
    print("Hola2");
  }

  // @override
  // void initState() {
  //   menu = _categoryIcon();
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   print("sss");
  //   return Text("prueba");
  // }
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;
    print("hola fase 1");

    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    // var onClickMenuIcon = () {
    //   Navigator.of(context).push(PageRouteBuilder(
    //       pageBuilder: (_, __, ___) => new menuDetail(),
    //       transitionDuration: Duration(milliseconds: 750),

    //       /// Set animation with opacity
    //       transitionsBuilder:
    //           (_, Animation<double> animation, __, Widget child) {
    //         return Opacity(
    //           opacity: animation.value,
    //           child: child,
    //         );
    //       }));
    // };

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    // var imageSlider = Container(
    //   height: 182.0,
    //   child: new Carousel(
    //     boxFit: BoxFit.cover,
    //     dotColor: Color(0xFF6991C7).withOpacity(0.8),
    //     dotSize: 5.5,
    //     dotSpacing: 16.0,
    //     dotBgColor: Colors.transparent,
    //     showIndicator: true,
    //     overlayShadow: true,
    //     overlayShadowColors: Colors.white.withOpacity(0.9),
    //     overlayShadowSize: 0.9,
    //     images: [
    //       AssetImage("assets/img/baner1.png"),
    //       AssetImage("assets/img/baner12.png"),
    //       AssetImage("assets/img/baner2.png"),
    //       AssetImage("assets/img/baner3.png"),
    //       AssetImage("assets/img/baner4.png"),
    //     ],
    //   ),
    // );

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        /// Use Stack to costume a appbar
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 58.5)),

                  /// Call var imageSlider
                  // imageSlider,

                  /// Call var categoryIcon
                  // categoryIcon,
                  _categoryIcon(),
                  //menu,
                  // _prueba(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),

                  /// Call a Grid variable, this is item list in Recomended item
                  // Grid,
                ],
              ),
            ),

            /// Get a class AppbarGradient
            /// This is a Appbar in home activity
            AppbarGradient(),
          ],
        ),
      ),
    );
  }

  Widget _categoryIcon() {
    print("daniel11");
    
    return FutureBuilder(
      future: menuProvider.getMenu(),
      builder: (BuildContext context, AsyncSnapshot<List<Jerarquia>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.0),
            alignment: AlignmentDirectional.centerStart,
            child: CategoryIconValueWidget(
              menuList: snapshot.data,
              tap1: this.holaMundo,
              titulo: AppLocalizations.of(context).tr('menu'),
            ),
          );
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
