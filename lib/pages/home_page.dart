import 'package:flutter/material.dart';

import '../drawer.dart';
import '../name_card_widget.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myText = 'My text';
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Learn Flutter'),
          ),
          drawer: MyDrawer(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: NameCardWidget(myText: myText, nameController: _nameController),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                myText = _nameController.text;
                setState(() {
                  
                });
              },
              child: Icon(Icons.edit)),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
