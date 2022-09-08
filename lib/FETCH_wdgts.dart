import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test1/pages/APILibraries.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'JsonObj.dart';

// Global variables
var animationDuration_1 = const Duration(milliseconds: 300);

class BreedSearchWidget extends StatefulWidget {
  const BreedSearchWidget({Key? key}) : super(key: key);

  @override
  State<BreedSearchWidget> createState() => _BreedSearchWidgetState();
}

class _BreedSearchWidgetState extends State<BreedSearchWidget> {
  Breed? _selected;
  late Future<List<Breed>> bList;
  var bError = 5;

  @override
  void initState() {
    super.initState();
    bList = getBreedList(0);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: FutureBuilder<List<Breed>>(
        future: bList,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return DropdownSearch<String>(
              items: ['...'],
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return DropdownSearch<Breed>(

                selectedItem: _selected,
                onChanged: (Breed? b) {
                  _selected = b;
                },
                compareFn: (i1, i2) => i1.name == i2.name,
                items: snapshot.data!,
                itemAsString: (Breed b) => b.name,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    fillColor: CupertinoColors.extraLightBackgroundGray,
                    filled: true,
                    labelText: 'Breed',
                    prefixIcon: Icon(CupertinoIcons.paw),
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  fit: FlexFit.loose,
                  constraints: BoxConstraints.tightFor(),
                  searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: 'Type breed name',
                      )),
                  itemBuilder: (ctx, item, isSelected) {
                    return ListTile(
                      title: Text(item.name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13.5, color: Colors.black)),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.image.url)),
                    );
                  },
                ),
                filterFn: (breed, filter) => breed.filterBreedItem(filter),
              );
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

void isLoading(BuildContext context, OverlayEntry loading, Size windowSize) {
  Offset offs = Offset((windowSize.width / 2) - 25, windowSize.height - 150);
  loading = OverlayEntry(
      builder: (BuildContext context) => Positioned(
            left: offs.dx,
            top: offs.dy,
            child: SizedBox(
              height: 50,
              width: 50,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballPulseSync,
                  colors: [Colors.black, Colors.teal, Colors.blueGrey]),
            ),
          ));
}

void stopLoading(OverlayEntry loading) {
  loading.remove();
}



// appBar initializer

AppBar init_appBar(GlobalKey<NavigatorState> navKey) {
  return AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          elevation: 0,
          title: Text(
            'FETCH',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
  );
}
