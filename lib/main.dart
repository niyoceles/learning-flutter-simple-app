import 'package:flutter/material.dart';
import 'package:myapplication/categories_screen.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        home: CategoriesScreen()
        // Constants.prefs.getBool("loggedIn") == true ? CategoriesScreen(): LoginPage(),
        // routes:{
        //   CategoriesScreen.routeName: (content)=> CategoriesScreen(),
        //   LoginPage.routeName: (content)=> LoginPage(),
        //   HomePageFB.routeName: (content)=> HomePageFB(),
        //   TodoScreen.routeName: (content)=> TodoScreen(),
        // }
        );
  }
}
