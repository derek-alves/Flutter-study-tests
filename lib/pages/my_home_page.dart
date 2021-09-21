import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/utils/time_helper.dart';

import 'mood_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var timeOfTheDay = TimeHelper.getTimeOfTheDay(DateTime.now());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            SizedBox(height: 64),
            FittedBox(
              child: Text(
                "Good $timeOfTheDay",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 64),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          key: Key("email"),
                          decoration: InputDecoration(hintText: "Email"),
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.isNotEmpty ? null : "Email should not be empty";
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          key: Key("password"),
                          validator: (value) {
                            return value!.isNotEmpty ? null : "Password should not be empty";
                          },
                          decoration: InputDecoration(hintText: "Password"),
                          controller: passwordController,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          key: Key("loginButton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoodScreen(),
                              ),
                            );
                          },
                          child: Text("Login"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
