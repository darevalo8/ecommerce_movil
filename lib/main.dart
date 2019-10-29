import 'package:ecomerce_movil/src/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ecomerce_movil/src/widgets/splashs_widget.dart';
import 'package:ecomerce_movil/src/bottom_navigation_bar.dart';
import 'package:ecomerce_movil/src/pages/login_page.dart';

/// Run first apps open
void main() => runApp(EasyLocalization(child: MyApp()));

/// Set orienttation
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return EasyLocalizationProvider(
      data: data,
      child: new MaterialApp(
        title: "Ecommerce",
        theme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorBrightness: Brightness.light,
            primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashScreenWidget(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => BtnNavigationBar(),
        },
        // home: SplashScreenWidget(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'assets/language',
          )
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'HK'),
          Locale('ar', 'DZ'),
          Locale('hi', 'IN'),
          Locale('id', 'ID'),
          Locale('es', 'ES'),
        ],
        locale: data.savedLocale,
      ),
    );
  }
}

/// Component UI
