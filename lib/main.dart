import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/Povider/SliderProvider.dart';
import 'package:provider_manager/Povider/ThemePrrovider.dart';

import 'Screens/Slider.dart';

void main() {
  runApp( MyApp(), );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),

      ],

      child: Builder(
          builder: (BuildContext context){

            final themeProvider = Provider.of<ThemeProvider>(context);

             return MaterialApp(
                 title: 'Flutter Demo',
                 themeMode: themeProvider.themeMode,
                 theme: ThemeData(
                    primarySwatch: Colors.blue,
                   appBarTheme: AppBarTheme(
                     color: Colors.teal,
                     centerTitle: true,
                     titleTextStyle: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight: FontWeight.bold,

                     ),

                   ),
                   colorScheme: ColorScheme.light(
                     primary: Colors.blue,
                     onPrimaryContainer : Colors.green,
                     onSecondaryContainer: Colors.red,

                   ),
                 ),
                 darkTheme: ThemeData(
                   brightness: Brightness.dark,
                   appBarTheme: AppBarTheme(
                     color: Colors.grey[900],
                     centerTitle: true,
                     titleTextStyle: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                   )
                 ),
                   colorScheme: ColorScheme.dark(
                     primary: Colors.blue,
                     onPrimaryContainer : Colors.green,
                     onSecondaryContainer: Colors.teal,
                   ),
                 ),
                 home:  SliderScreen()
             );
          }
      ),
    );
  }
}
