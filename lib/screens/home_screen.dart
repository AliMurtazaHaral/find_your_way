import 'package:find_your_way/screens/connection_screen.dart';
import 'package:find_your_way/screens/detect_object_screen.dart';
import 'package:find_your_way/screens/detect_place_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final bluetooth = GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>const ConnectionScreen()));
      },
      child: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
    );
    final detectPlace = GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>const DetectPlaceScreen()));
      },
      child: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
    );
    final detectObject = GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>const DetectObjectScreen()));
      },
      child: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("CONNECT DEVICE",style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("Connect device from Bluetooth"),
                        ],
                      ),
                      bluetooth,
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("DARK MODE",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("Change theme app"),
                        ],
                      ),
                      bluetooth,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("DISTANCE SOUND",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("Use sound for distance"),
                        ],
                      ),
                      detectObject,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("DISTANCE SENSITIVITY",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("Use alert Sensitivity"),
                        ],
                      ),
                      detectPlace,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("NOTIFICATIONS",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("All Notifications"),
                        ],
                      ),
                      bluetooth,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Column(
                        children: [
                          Text("MAPS SETTINGS",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          Text("Advance Settings"),
                        ],
                      ),
                      bluetooth,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
