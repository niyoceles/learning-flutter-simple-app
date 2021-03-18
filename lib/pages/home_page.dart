// import 'package:awesome_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapplication/constants/constants.dart';
import 'package:myapplication/pages/login_page.dart';
import 'dart:convert' as convert;
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var myText = 'My text';
  // TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = convert.jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Learn Flutter'),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Constants.prefs.setBool("loggedIn", false);
                    Navigator.pushReplacementNamed(
                        context, LoginPage.routeName);
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
          ),
          drawer: MyDrawer(),
          body: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(data[index]["title"]),
                        subtitle: Text("ID: ${data[index]["id"]}"),
                        leading: FadeInImage(
                            image: NetworkImage(data[index]["url"]),
                            placeholder:
                                AssetImage('/assets/images/food1.jpg')));
                  },
                  itemCount: data.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                // myText = _nameController.text;
                // setState(() {});
              },
              child: Icon(Icons.edit)),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
