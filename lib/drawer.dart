import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Celestin Niyonsaba'),
            accountEmail: Text('niyoceles3@gmail.com'),
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
            subtitle: Text('niyoceles3@gmail.com'),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
