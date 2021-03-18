import 'package:flutter/material.dart';
import 'package:myapplication/constants/constants.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:myapplication/pages/home_page.dart';

import 'home_page_with_fb.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Login page')),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
                'assets/images/christopher-gower-m_HRfLhgABo-unsplash.jpg',
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: size.height * 0.03),
                              SvgPicture.asset(
                                "assets/icons/login.svg",
                                height: size.height * 0.35,
                              ),
                              SizedBox(height: size.height * 0.03),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter an email',
                                    labelText: 'email address'),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter password',
                                    labelText: 'password'),
                              ),
                              SizedBox(height: 20),
                              Center(
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () {
                                    Constants.prefs.setBool("loggedIn", true);
                                    // Navigator.push(
                                    //   context, MaterialPageRoute(builder: (context)=>HomeScreen())
                                    // );
                                    Navigator.pushReplacementNamed(
                                        context, HomePageFB.routeName);
                                  },
                                  child: Text("Login"),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
