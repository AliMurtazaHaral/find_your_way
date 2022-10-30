import 'package:find_your_way/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetectObjectScreen extends StatefulWidget {
  const DetectObjectScreen({Key? key}) : super(key: key);

  @override
  State<DetectObjectScreen> createState() => _DetectObjectScreenState();
}

class _DetectObjectScreenState extends State<DetectObjectScreen> {
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
                      onPressed: () {},
                      child: const Text(
                        "Detecting the object",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Image(image: AssetImage("assets/images/detectObject.PNG")),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/images/sound.PNG")),
                      Column(
                        children: [
                          Image(image: AssetImage("assets/images/chair.PNG")),
                          Text("a seat, especially for one\nperson, usually having\nfour legs for support and\na rest for the back and\noften having rests for\nthe arms."
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
