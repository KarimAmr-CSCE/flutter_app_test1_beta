import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test1/pages/APILibraries.dart';
import 'package:flutter_app_test1/JsonObj.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../FETCH_wdgts.dart';

PanelController _pc = new PanelController();

// Elevated Card
class breedSearchPage extends StatefulWidget {
  const breedSearchPage({Key? key}) : super(key: key);

  @override
  State<breedSearchPage> createState() => _breedSearchPageState();
}



class _breedSearchPageState extends State<breedSearchPage> {
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  var age_r = RangeValues(1, 20);
  String _genderValue = 'Male';

  @override
  void initState() {
    super.initState();
    _pc.open();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        backdropEnabled: true,
        minHeight: 50,
        maxHeight: 250,
        controller: _pc,
        panel: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BreedSearchWidget(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Age Range',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
              ),
              RangeSlider(
                values: age_r,
                activeColor: Colors.teal,
                inactiveColor: Colors.teal[100],
                onChanged: (RangeValues n) {
                  setState(() => age_r = n);
                },
                min: 1,
                max: 20,
                divisions: 19,
                labels:
                    RangeLabels('${age_r.start.ceil()}', '${age_r.end.ceil()}'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gender ',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 13),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: _genderValue,
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        setState(() {
                          _genderValue = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_pc.isAttached) {
                                _pc.close();
                              } else {}
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.teal)),
                            child: Text(
                              'Find matches',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: Colors.grey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black54,
                  )),
            ],
          ),
        ),
        body: Scaffold(
          appBar: AppBar(
            title: Text(
              'FETCH',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: false,
            leadingWidth: 0,
            backgroundColor: Colors.white70,
          ),
          body: Center(
            child: Text("This is the Widget behind the sliding panel"),
          ),
        ),
        borderRadius: radius,
      ),
    );
  }
}
