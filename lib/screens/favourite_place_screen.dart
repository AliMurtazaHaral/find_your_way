import 'package:find_your_way/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritePlaceScreen extends StatefulWidget {
  const FavouritePlaceScreen({Key? key}) : super(key: key);

  @override
  State<FavouritePlaceScreen> createState() => _FavouritePlaceScreenState();
}

class _FavouritePlaceScreenState extends State<FavouritePlaceScreen> {
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

                Image(image: AssetImage("assets/images/favPlace.PNG")),
                Image(image: AssetImage("assets/images/lisy.PNG")),
                Image(image: AssetImage("assets/images/map.PNG")),

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
