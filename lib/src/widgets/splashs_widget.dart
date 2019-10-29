import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecomerce_movil/UI/LoginOrSignup/Signup.dart';
import 'package:ecomerce_movil/src/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

/// Component UI
class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  /// Check user
  bool _checkUser = true;

  SharedPreferences prefs;

  Future<Null> _function() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    this.setState(() {
      if (prefs.getString("username") != null) {
        print('false');
        _checkUser = false;
      } else {
        print('true');
        _checkUser = true;
      }
    });
  }

  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), navigatorPage);
  }

  /// To navigate layout change
  void navigatorPage() {
    // Navigator.of(context).pushReplacement(
    //     PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()));
    Navigator.pushNamed(context, 'login');
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
    _function();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          /// Set Background image in splash screen layout (Click to open code)
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/man.png'), fit: BoxFit.cover)),
          child: Container(
            /// Set gradient black in image splash screen (Click to open code)
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromRGBO(0, 0, 0, 0.3),
                  Color.fromRGBO(0, 0, 0, 0.4)
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      /// Text header "Welcome To" (Click to open code)
                      Text(
                        AppLocalizations.of(context).tr('welcomeTo'),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Sans",
                          fontSize: 19.0,
                        ),
                      ),

                      /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                      Hero(
                        tag: "Treva",
                        child: Text(
                          AppLocalizations.of(context).tr('title'),
                          style: TextStyle(
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.w900,
                            fontSize: 35.0,
                            letterSpacing: 0.4,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
