import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:ecomerce_movil/Library/carousel_pro/src/carousel_pro.dart';
import 'package:ecomerce_movil/src/model/menu_model.dart';
import 'package:ecomerce_movil/src/providers/menu_provider.dart';
import 'package:ecomerce_movil/src/widgets/category_detail_widget.dart';
import 'package:ecomerce_movil/src/widgets/category_icon_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_movil/ListItem/HomeGridItemRecomended.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/AppbarGradient.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/DetailProduct.dart';
import 'package:ecomerce_movil/UI/HomeUIComponent/MenuDetail.dart';
import 'package:ecomerce_movil/src/model/menu_model.dart';

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
  List<Detalle> detalle = [];

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    var imageSlider = Container(
      height: 182.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/baner1.png"),
          AssetImage("assets/img/baner12.png"),
          AssetImage("assets/img/baner2.png"),
          AssetImage("assets/img/baner3.png"),
          AssetImage("assets/img/baner4.png"),
        ],
      ),
    );

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
                  imageSlider,

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
                  _prueba(detalle),

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
    return FutureBuilder(
      future: menuProvider.getMenu(),
      builder: (BuildContext context, AsyncSnapshot<List<Jerarquia>> snapshot) {
        if (snapshot.hasData) {
          menuList = snapshot.data;
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.0),
            alignment: AlignmentDirectional.centerStart,
            child: _generateMenu(),
            // child: CategoryIconValueWidget(
            //   menuList: snapshot.data,
            //   tap1: this.holaMundo,
            //   titulo: AppLocalizations.of(context).tr('menu'),
            // ),
          );
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _generateMenu() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateListMenu());
  }

  List<Widget> _generateListMenu() {
    List<Widget> menu = new List();
    List<Widget> fila = new List();

    var paddingTwo = Padding(padding: EdgeInsets.only(top: 20.0));
    menu.add(paddingTwo);

    for (var itemJson in menuList) {
      var item = InkWell(
        // key: ,
        onTap: () {
          setState(() {
            detalle = itemJson.detalle;
          });
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/icon/otomotif.png",
              height: 19.2,
            ),
            Padding(padding: EdgeInsets.only(top: 7.0)),
            Text(
              itemJson.nombre,
              style: TextStyle(
                fontFamily: "Sans",
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );
      fila.add(item);
    }
    bool bandera = true;
    while (bandera) {
      if (fila.length <= 4) {
        menu.add(this.addRow(fila));
        fila = new List();
      } else if (fila.length > 4) {
        menu.add(this.addRow(fila.sublist(0, 4)));
        fila.removeRange(0, 4);
      }
      if (fila.length == 0) {
        bandera = false;
      }
    }
    return menu;
  }

  Widget addRow(List<Widget> itemsRow) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: itemsRow);
  }

  Widget _prueba(List<Detalle> detalle) {
    // return CategoryDetail(
    //   image: "assets/imgCamera/CameraDigital.png",
    //   title: detalle,
    // );

    return SingleChildScrollView(
      child: Container(
        // height: 300.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                AppLocalizations.of(context).tr('recomended'),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0,
                ),
              ),
            ),

            /// To set GridView item
            GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 17.0,
                childAspectRatio: 0.545,
                crossAxisCount: 2,
                primary: false,
                children: List.generate(
                  detalle.length,
                  (index) => CategoryDetail(
                    image: "assets/imgCamera/CameraDigital.png",
                    title: detalle[index].nombre,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
