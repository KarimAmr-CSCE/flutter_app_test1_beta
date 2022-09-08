import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //Controllers
  final PhoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    PhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String city = 'Cairo';
    String country = 'Egypt';
    return Scaffold(

      body: SingleChildScrollView(
          child: Column(
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
                            labelText: 'Name',
                          )
                          ,
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Last Name',
                          )
                          ,
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Email',
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
                            labelText: 'Password',
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
                            labelText: 'Re-enter password',
                          )
                          ,
                        )
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: DropdownButton<String>(
                              value: country,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                              underline: Container(
                                height: 1,
                                color: Colors.grey[400],
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  country = newValue!;
                                });
                              },
                              items: <String>['Egypt']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                              value: city,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15),
                              underline: Container(
                                height: 1,
                                color: Colors.grey[400],
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  city = newValue!;
                                });
                              },
                              items: <String>['Cairo','Giza', 'Alexandria', 'Marsa Matrouh']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: '+20',
                              )
                              ,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(

                            child: TextFormField(
                              controller: PhoneController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: '1223456789',
                              )
                              ,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: ()
                        async {
                          if (PhoneController.text.length != 10){
                            //ALERT USER
                          }else{
                            // await FirebaseAuth.instance.verifyPhoneNumber(
                            //   phoneNumber: "0" + PhoneController.text,
                            //   verificationCompleted: (PhoneAuthCredential credential) {},
                            //   verificationFailed: (FirebaseAuthException e) {},
                            //   codeSent: (String verificationId, int? resendToken) {},
                            //   codeAutoRetrievalTimeout: (String verificationId) {},
                            // );
                          }
                        }
                     ,
                        child: Text("Verify Phone"),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(

                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Text('Already a user? Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Sign up", textAlign: TextAlign.center),
                      )
                      ],
                    ),
                  ],
                ),

              ),
            ],
          )
      ),
    );
  }
}
