import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test1/FETCH_wdgts.dart';
import 'package:flutter_app_test1/routesGenerator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app_test1/JsonObj.dart';
import 'package:flutter_app_test1/pages/APILibraries.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/src/widgets/image.dart' as IMAGE;
import 'package:loading_indicator/loading_indicator.dart';

int _selectedIndex = 0;
// final isRoot = ValueNotifier<int>(1);
 final img_src =  ValueNotifier<int>(0);
bool loading = true;
class addBreedPage extends StatefulWidget {
  const addBreedPage({Key? key}) : super(key: key);


  @override
  State<addBreedPage> createState() => _addBreedPageState();
}



class _addBreedPageState extends State<addBreedPage> {

    late Future<List<Breed>> finalBreeds;
    File? imageFile;
    late Future<PhotoResponse> pRes;
    late FToast fToast;
    var p_stat = -2;
    late Color statColor;
    late OverlayEntry loading;
    final Size windowSize = MediaQueryData.fromWindow(window).size;
    var cam_Btn = true;



    Future<int> analyzeImage() async {
      try{
        final resp = await getUploadResponse(imageFile!);
        if (resp.approved == 1){
          return 0;
        }else{
          final _msg = resp.url != null ? resp.url : 'message unfetched.';
          return -1;
        }
      } on PlatformException catch (e){
        print('Error fetching response');
        return -2;
      }
    }

    Future<int> pickImage(ImageSource src) async {
      try{
        final image = await ImagePicker().pickImage(source: src);
        if (image == null) {
          print('no image');
          // img_src.value = 0;
        }
        imageFile = File(image!.path);
        print(imageFile.toString());
        img_src.value = 1;
        return 1;

      } on PlatformException catch (e){
        print('Exception caught for camera access : $e');
        // img_src.value = 0;
        return 0;

      }

    }

    _showToast(String _t) {
      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.greenAccent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check),
            SizedBox(
              width: 12.0,
            ),
            Text(_t),
          ],
        ),
      );


      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );

      // Custom Toast Position
      fToast.showToast(
          child: toast,
          toastDuration: Duration(seconds: 2),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 16.0,
              left: 16.0,
            );
          });
    }


    void isLoading(){
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
                  colors:  [Colors.black, Colors.teal, Colors.blueGrey]
              ),
            ),
          )
      );
    }


    void stopLoading(){
      loading.remove();
    }

    @override
  void initState() {
    super.initState();
    finalBreeds = getBreedList(0);
    fToast = FToast();
    p_stat = -2;
    statColor = Colors.grey;
    img_src.value = 0;
    cam_Btn = true;
  }

    // @override
    // void didChangeDependencies() {
    //   super.didChangeDependencies();
    // }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);


    //handle status color for photo analysis
    Color handleColor() {
      statColor =
      p_stat == 0 ? Colors.teal : p_stat == -1 ? Colors.redAccent : Colors.grey;
      return statColor;
    }
    return Scaffold(
        appBar: init_appBar(BA_key),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                    'Verify Your Pet',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ),Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Take a clear photo of your pet',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                        radius: 100,
                        backgroundColor: handleColor(),
                        child: ValueListenableBuilder<int>(
                              valueListenable: img_src,
                            builder: (BuildContext context, int value, Widget? child){
                                if (value == 0){
                                  return const CircleAvatar (
                                      radius: 70,
                                      backgroundImage: IMAGE.AssetImage('assets/images/mini.png'));
                                }else{
                                  return CircleAvatar (
                                      radius: 70,
                                      backgroundImage: IMAGE.FileImage(imageFile!));
                                }
                            }
                        )
                    )
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal.shade100,
                  onPrimary: Colors.red,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      )
              ),
              onPressed: () async{
                if (cam_Btn){
                  await pickImage(ImageSource.gallery);
                  print(cam_Btn);
                  setState(() {});
                  p_stat = -2;
                  isLoading();
                  OverlayState? overlay = Overlay.of(context);
                  overlay?.insert(loading);
                  cam_Btn = false;
                  // p_stat = await analyzeImage();
                  setState(() {});
                  stopLoading();
                  cam_Btn = true;
                }

              },
                icon: Icon(Icons.camera_alt_outlined,
                color: Colors.grey.shade900),
                label: Text('Open Camera',
                style: TextStyle(
                  color: Colors.grey.shade900
                ),),
            ),
            SizedBox(height: 20),
            AnimatedSlide(
              duration: animationDuration_1,
              offset: p_stat == 0 ? Offset(0, 0) : Offset.zero ,
              child: AnimatedOpacity(
                duration: animationDuration_1,
                opacity: p_stat == -1 ? 1 : 0,

                child: Text("Couldn't find a dog in photo",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.redAccent
                  )),
              ),
            )
          ],
        ),
      floatingActionButton: AnimatedSlide(
        duration: animationDuration_1,
        offset: p_stat == 0 ? Offset(0, 0) : Offset.zero ,
        child: AnimatedOpacity(
          duration: animationDuration_1,
          opacity: p_stat == 0 ? 1 : 1,

          child: FloatingActionButton.extended(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            label: Text('Next'),
            icon: Icon(Icons.navigate_next_outlined),
            onPressed: () {
              print('what?');
              BA_key.currentState?.pushNamed('/pet_register', arguments: imageFile);
              setState((){});
            },
          ),
        ),
      ),
    );
  }

  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });


  }
}
