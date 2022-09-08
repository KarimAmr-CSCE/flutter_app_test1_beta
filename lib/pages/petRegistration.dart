import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_app_test1/FETCH_wdgts.dart';
import 'package:flutter_app_test1/routesGenerator.dart';


class petRegPage extends StatefulWidget {
  final File recFile;
  const petRegPage({Key? key, required this.recFile}) : super(key: key);



  @override
  State<petRegPage> createState() => _petRegPageState();
}

class _petRegPageState extends State<petRegPage> {

  @override
  void initState(){
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: init_appBar(BA_key),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Continue Pet Registration',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700

                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(widget.recFile),
                  ),
                )
              ],
            ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CupertinoTextField(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                  borderRadius: BorderRadius.circular(10)
                ),
                placeholder: '',
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CupertinoColors.extraLightBackgroundGray,
                    borderRadius: BorderRadius.circular(10)
                ),
                placeholder: 'Age',
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CupertinoColors.extraLightBackgroundGray,
                    borderRadius: BorderRadius.circular(10)
                ),
                placeholder: 'Name',
              ),
              CupertinoTextField(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CupertinoColors.extraLightBackgroundGray,
                    borderRadius: BorderRadius.circular(10)
                ),
                placeholder: 'Name',
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: BreedSearchWidget()),
                ],
              ),

            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
