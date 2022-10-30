import 'package:find_your_way/screens/dashboard_screen.dart';
import 'package:find_your_way/screens/new_place_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetectPlaceScreen extends StatefulWidget {
  const DetectPlaceScreen({Key? key}) : super(key: key);

  @override
  State<DetectPlaceScreen> createState() => _DetectPlaceScreenState();
}

class _DetectPlaceScreenState extends State<DetectPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5b8bdf),
            Color(0xFF05c7e4),
          ],
        )),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width*.92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      minWidth: MediaQuery.of(context).size.width*.7,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPlaceScreen()));
                      },
                      child: const Text(
                        "Detecting new Place",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                Image(image: AssetImage("assets/images/detectPlace.PNG")),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/images/sound.PNG")),
                      Column(
                        children: [
                          Image(image: AssetImage("assets/images/schoolRoom.PNG")),
                          Text("A classroom or\nschoolroom is a\nlearning space in\nwhich both children\nand adults learn."
                          )
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                  },
                  child: Image(image: AssetImage("assets/images/home.PNG")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
