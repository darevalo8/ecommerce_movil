import 'dart:async';

import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:ecomerce_movil/src/animations/login_animation.dart';
import 'package:ecomerce_movil/src/providers/user_provider.dart';
import 'package:ecomerce_movil/src/widgets/button_black_buttom_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;
  var tap = 0;
  var userProvider = UserProvider();
  String email = '', password = '';

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });

    super.initState();
  }

  /// Dispose animationController
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _playAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              /// Set Background image in layout
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/img/backgroundgirl.png"),
                fit: BoxFit.cover,
              )),
              child: Container(
                /// Set gradient color in image
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.2),
                      Color.fromRGBO(0, 0, 0, 0.3)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),

                /// Set component layout
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.topCenter,
                              child: Column(
                                children: <Widget>[
                                  /// padding logo
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: mediaQueryData.padding.top +
                                              40.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image:
                                            AssetImage("assets/img/Logo.png"),
                                        height: 70.0,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0)),

                                      /// Animation text treva shop accept from login layout
                                      Hero(
                                        tag: "Treva",
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .tr('title'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.6,
                                              fontFamily: "Sans",
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 70.0)),

                                  /// TextFromField Email
                                  inputEmail(
                                      false,
                                      AppLocalizations.of(context).tr('email'),
                                      Icons.email,
                                      TextInputType.emailAddress),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField Password
                                  inputPassword(
                                      true,
                                      AppLocalizations.of(context)
                                          .tr('password'),
                                      Icons.vpn_key,
                                      TextInputType.text),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: mediaQueryData.padding.top + 175.0,
                                        bottom: 0.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// Set Animaion after user click buttonLogin
                        /// before return tap, use function for login
                        tap == 0
                            ? InkWell(
                                splashColor: Colors.yellow,
                                onTap: () {
                                  if (this.email.isNotEmpty &&
                                      this.password.isNotEmpty) {
                                    userProvider
                                        .login(email, password)
                                        .then((data) {
                                      if (data.toString().isNotEmpty) {
                                        this._showAlert(context, data);
                                      } else {
                                        setState(() {
                                          tap = 1;
                                        });
                                        _playAnimation();
                                      }
                                    });
                                  }else{
                                    this._showAlert(context, "Por favor llene los campos");
                                  }

                                  return tap;
                                },
                                child: ButtonBlackBottom(
                                  text:
                                      AppLocalizations.of(context).tr('login'),
                                ),
                              )
                            : new LoginAnimation(
                                animationController: sanimationController.view,
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputEmail(
      bool password, String email, IconData icon, TextInputType inputType) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
            onChanged: (value) {
              setState(() {
                this.email = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget inputPassword(
      bool password, String email, IconData icon, TextInputType inputType) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
            onChanged: (value) {
              setState(() {
                this.password = value;
              });
            },
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context, String mesage) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Alerta'),
            content: Column(
              // se adapta el tamaño al contenido
              //el contenido dice que tan ancho es
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mesage),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
