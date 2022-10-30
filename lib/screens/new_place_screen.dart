import 'package:find_your_way/screens/dashboard_screen.dart';
import 'package:find_your_way/screens/favourite_place_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPlaceScreen extends StatefulWidget {
  const NewPlaceScreen({Key? key}) : super(key: key);

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  TextEditingController bluetoothController = TextEditingController();
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
                SizedBox(
                  width: MediaQuery.of(context).size.width*.75,
                  child: TextFormField(
                      autofocus: false,
                      controller:bluetoothController,
                      obscureText: false,
                      validator: (value) {

                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }

                      },
                      onSaved: (value) {
                        bluetoothController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(

                        fillColor: Color(0xFFececec),
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Your Place",
                        suffix: Icon(Icons.bluetooth,color: Colors.blue,),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: null,
                          fontStyle: FontStyle.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                Image(image: AssetImage("assets/images/text.PNG")),
                Image(image: AssetImage("assets/images/place.PNG")),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      minWidth: MediaQuery.of(context).size.width*.5,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritePlaceScreen()));
                      },
                      child: const Text(
                        "New place",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
