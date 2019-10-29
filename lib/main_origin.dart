// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:ecomerce_movil/widgets/bottomNavBar.dart';

// main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var data = EasyLocalizationProvider.of(context).data;

//     /// To set orientation always portrait
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);

//     ///Set color status bar
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//       statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
//     ));
//     return EasyLocalizationProvider(
//       data: data,
//       child: new MaterialApp(
//         title: "Treva Shop",
//         theme: ThemeData(
//             brightness: Brightness.light,
//             backgroundColor: Colors.white,
//             primaryColorLight: Colors.white,
//             primaryColorBrightness: Brightness.light,
//             primaryColor: Colors.white),
//         debugShowCheckedModeBanner: false,
//         home: bottomNavigationBar(),
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           EasylocaLizationDelegate(
//             locale: data.locale,
//             path: 'assets/language',
//           )
//         ],
//         supportedLocales: [
//           Locale('en', 'US'),
//           Locale('es', 'ES'),
//           Locale('ar', 'DZ'),
//           Locale('hi', 'IN'),
//           Locale('id', 'ID')
//         ],
//         locale: data.savedLocale,
//       ),
//     );
//   }
// }
