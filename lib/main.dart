import 'package:flutter/material.dart';
import 'package:myapplication/constants/constants.dart';
// import 'package:myapplication/pages/home_page.dart';
import 'package:myapplication/pages/home_page_with_fb.dart';
// import 'package:myapplication/pages/home_page.dart';
import 'package:myapplication/pages/login_page.dart';
import 'package:myapplication/pages/todos_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: Constants.prefs.getBool("loggedIn") == true ? HomePageFB(): LoginPage(),
        routes:{
          LoginPage.routeName: (content)=> LoginPage(),
          HomePageFB.routeName: (content)=> HomePageFB(),
          TodoScreen.routeName: (content)=> TodoScreen(),
        });
  }
}
