import 'package:ecomerce_movil/src/model/menu_model.dart';
import 'package:flutter/material.dart';

class CategoryIconValueWidget extends StatelessWidget {
  // String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  // GestureTapCallback tap1, tap2, tap3, tap4;
  GestureTapCallback tap1;
  final List<Jerarquia> menuList;
  String titulo;
  // CategoryIconValueWidget(
  //     {this.icon1,
  //     this.tap1,
  //     this.icon2,
  //     this.tap2,
  //     this.icon3,
  //     this.tap3,
  //     this.icon4,
  //     this.tap4,
  //     this.title1,
  //     this.title2,
  //     this.title3,
  //     this.title4});
  CategoryIconValueWidget(
      {@required this.menuList, @required this.tap1, @required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateListMenu());
  }

  List<Widget> _generateListMenu() {
    List<Widget> menu = new List();
    List<Widget> fila = new List();
    var paddingOne = Padding(
        padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
        child: Text(
          this.titulo,
          style: TextStyle(
              fontSize: 13.5, fontFamily: "Sans", fontWeight: FontWeight.w700),
        ));
    var paddingTwo = Padding(padding: EdgeInsets.only(top: 20.0));
    menu.add(paddingOne);
    menu.add(paddingTwo);
    // for (var itemJson in menuList) {
    //   var item = InkWell(
    //     onTap: tap1,
    //     child: Column(
    //       children: <Widget>[
    //         Image.asset(
    //           "assets/icon/otomotif.png",
    //           height: 19.2,
    //         ),
    //         Padding(padding: EdgeInsets.only(top: 7.0)),
    //         Text(
    //           itemJson.nombre,
    //           style: TextStyle(
    //             fontFamily: "Sans",
    //             fontSize: 10.0,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         )
    //       ],
    //     ),
    //   );

    //   fila.add(item);
    //   print(itemJson.nombre);
    //   if (fila.length%4 == 0) {
        
    //     menu.add(this.addRow(fila));
    //     // fila.clear();
    //     fila = new List();
        
    //   }
    //   else{
    //     menu.add(this.addRow(fila));
    //   }
    // }
    var longitud = menuList.length;
    print("La logintud es: $longitud ");
    for (var item in menuList){
      print(item.nombre);
    }
    return menu;
  }

  Widget addRow(List<Widget> itemsRow) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: itemsRow
    );
  }
}
