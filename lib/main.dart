import 'package:flutter/material.dart';
import 'package:my_browerser/provider/connectivity_provider.dart';
import 'package:my_browerser/provider/url_provider.dart';
import 'package:my_browerser/views/HomePage.dart';
import 'package:my_browerser/views/Splash_screens.dart';
import 'package:my_browerser/views/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/url_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);3
  // }

  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> bookmarkPageName = prefs.getStringList('bookmarkPageName') ?? [];
  List<String> bookmarkPageUrl = prefs.getStringList('bookmarkPageUrl') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UrlProvider(
            urlModel: UrlModel(
              url: "https://www.google.com/",
              searchController: TextEditingController(),
              bookmarkPageName: bookmarkPageName,
              bookmarkPageUrl: bookmarkPageUrl,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splash_screens(),
          'intro': (context) => GetStarted(),
          'HomePage': (context) => const HomePage(),
        },
      ),
    ),
  );
}
