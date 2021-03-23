// import 'package:awesome_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapplication/constants/constants.dart';
import 'package:myapplication/pages/login_page.dart';
import 'dart:convert' as convert;
import '../widgets/drawer.dart';

class TodoScreen extends StatefulWidget {
  static const String routeName = "/todos";
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // var myText = 'My text';
  // TextEditingController _nameController = TextEditingController();
  String input = "";
  List todos = List();
  @override
  void initState() {
    super.initState();
    todos.add('item1');
    todos.add('item2');
    todos.add('item3');
    todos.add('item4');
    todos.add('item5');
    todos.add('item6');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          body: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext content, int index) {
                return Dismissible(
                    key: Key(todos[index]),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        title: Text(todos[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ));
              }),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext content) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        title: Text("Add Todo list"),
                        content: TextField(onChanged: (String value) {
                          input = value;
                        }),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                todos.add(input);
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text('Add'),
                          )
                        ],
                      );
                    });
              },
              child: Icon(Icons.add)),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
