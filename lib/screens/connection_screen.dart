import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bluetooth = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/forgetPassword');
      },
      child: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
    );
    //Search field
    final searchField = SizedBox(
      width: MediaQuery.of(context).size.width*.75,
      child: TextFormField(
          autofocus: false,
          controller: searchController,
          obscureText: false,
          validator: (value) {

            if (value!.isEmpty) {
              return ("Password is required for login");
            }

          },
          onSaved: (value) {
            searchController.text = value!;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(

            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: null,
              fontStyle: FontStyle.normal,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
    final searchButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: MaterialButton(
        minWidth: 50,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          onPressed: () {

          },
          child: Icon(Icons.search,color: Colors.black,)),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(

                color: Colors.cyan,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    searchField,
                    searchButton,
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF5b8bdf),
                      Color(0xFF05c7e4),
                    ],
                  )
              ),
            child: Column(
              children: [
                Text("Connect Your\nSmart Glasses",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          child: MaterialButton(
                              minWidth: 50,
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              onPressed: () {

                              },
                              child: Image(image: AssetImage("assets/images/b_glasses.PNG"),)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Connect bluetooth",style: TextStyle(fontSize: 10),)
                      ],
                    ),
                      Text("")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Column(
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            child: MaterialButton(
                                minWidth: 50,
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                onPressed: () {

                                },
                                child: Image(image: AssetImage("assets/images/location.PNG"),)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Set your location",style: TextStyle(fontSize: 10),)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            child: MaterialButton(
                                minWidth: 50,
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                onPressed: () {

                                },
                                child: Image(image: AssetImage("assets/images/sound.PNG"),)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Tap here to listen your location",style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      Text("")
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: const Color(0xFFffffff),
        selectedItemColor: Colors.blueAccent,
        currentIndex: 0,
        onTap: (index) => setState(() {

        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.white,
            ),
            backgroundColor: Color(0xFFffff),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.black,
            ),
            backgroundColor: Color(0xFF161616),
            label: "",
          ),
        ],
      ),
    );
  }
}
