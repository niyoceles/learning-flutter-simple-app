import 'package:flutter/material.dart';
import 'package:myapplication/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {

  // ignore: missing_return
  Future<Function> mypreferences () async{
    Constants.prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Celestin Niyonsaba'),
            accountEmail: Text(Constants.prefs.getString("email")),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/user/erondu/1600x900')),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Celestin Niyonsaba'),
            subtitle: Text('Mobile developer'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(Constants.prefs.getString("email")),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
