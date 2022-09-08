import 'package:flutter/material.dart';
import 'package:flutter_app_test1/routesGenerator.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical:50),
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text('FETCH',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      )),
                  SizedBox(height: 5),
                  Text('for dog community',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                      ))
                ],
              )
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter username',
                      )
                      ,
                    )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Password',
                      )
                      ,
                    )
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(

                        onTap: (){
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text('New user?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(width: 140),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: Text('Forgot Password?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [ElevatedButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, '/mainApp');
                      rootNav_key.currentState?.pop();
                      rootNav_key.currentState?.pushNamed('/mainApp');
                    },
                    child: Text("Login", textAlign: TextAlign.center),
                  )
                  ],
                ),
              ],
            ),

          ),
        ],
      ),

    );
  }
}
