import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/Povider/SliderProvider.dart';

import '../Povider/ThemePrrovider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Slider'),
        actions: [
          Consumer<ThemeProvider>(
              builder: (context,themeProvider,_){
                final isDark = themeProvider.themeMode == ThemeMode.dark;
                return IconButton(
                  icon: Icon(isDark ? Icons.light_mode :Icons.dark_mode  ),
                  onPressed: () {
                    themeProvider.toggleThemeMode();
                  },
                );
              }
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // RadioListTile<ThemeMode>(
          //   title: Text("Light Theme"),
          //   value: ThemeMode.light,
          //   groupValue: themeProvider.themeMode, // should also be ThemeMode
          //   onChanged: themeProvider.setThemeMode,
          // ),
          // RadioListTile<ThemeMode>(
          //   title: Text("dark Theme"),
          //   value: ThemeMode.dark,
          //   groupValue: themeProvider.themeMode, // should also be ThemeMode
          //   onChanged: themeProvider.setThemeMode,
          // ),

          Consumer<SliderProvider>(
            builder: (ctx, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  ctx.read<SliderProvider>().setValue(val);
                  print(value.value);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (ctx, value, child) {
              final primaryColor = Theme.of(context).colorScheme.primary;
              final secandaryColor = Theme.of(context).colorScheme.secondary;
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: primaryColor.withOpacity(value.value),
                      child: Center(child: Text('Continer 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: secandaryColor.withOpacity(value.value),
                      child: Center(child: Text('Continer 2')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
