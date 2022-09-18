import 'package:flutter/material.dart';
import 'package:flutter_app_test1/FETCH_wdgts.dart';
import 'package:flutter_app_test1/routesGenerator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Category {
  String name;
  Category({@required this.name});
}
List<Category> categories = [
  Category(name: 'Parks'),
  Category(name: 'Vets'),
  Category(name: 'Pet Stores'),
];
class CategoryRenderingService {
  List<Category> categories;
  int selectedIndex = 0;
CategoryRenderingService({@required this.categories});
List<Widget> render() {
    return categories.map((category) {
      bool selected = categories.indexOf(category) == selectedIndex;
      
      TextStyle style = selected ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(fontWeight: FontWeight.normal);
      return Text(category.name, style: style);
    }).toList();
  }
}

int _selectedIndex = 0;
class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: init_appBar(rootNav_key), // CHANGE KEY!!!
        body: Column(
          children:
          [
            Row(
              children: [
                IconButton(onPressed:(){}, icon: Icon(Icons.search),)
              ],
            ),
             Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target:LatLng(31.233334,30.033333),zoom: 5.4746,
                ),
              ),
            ),
          ],
        )
    );
  }
  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }

}
