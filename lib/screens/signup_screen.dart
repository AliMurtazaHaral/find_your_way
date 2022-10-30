import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_way/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final datOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //full name field
    final fullNameField = TextFormField(
        autofocus: false,
        controller: fullNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          fullNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color(0xFFececec),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "                   Full Name",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: null,
            fontStyle: FontStyle.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          fullNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color(0xFFececec),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "                       Email",
          hintStyle: const TextStyle(
            color: Colors.grey, // <-- Change this
            fontSize: null,
            fontStyle: FontStyle.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          fullNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Color(0xFFececec),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "                   Password",
          hintStyle: const TextStyle(
            color: Colors.grey, // <-- Change this
            fontSize: null,
            fontStyle: FontStyle.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final dateOfBirthField = TextFormField(
        autofocus: false,
        controller: datOfBirthController,
        obscureText: false,
        onSaved: (value) {
          datOfBirthController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Color(0xFFececec),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "                   22-10-21",
          hintStyle: const TextStyle(
            color: Colors.grey, // <-- Change this
            fontSize: null,
            fontStyle: FontStyle.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF9db1d6),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
              signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "CREATE ACCOUNT",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          )),
    );
    //Login
    final login = GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      },
      child: const Text(
        'Log in here.',
        style: TextStyle(
            color: Colors.grey, fontSize: 10, fontWeight: FontWeight.normal),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Create New\n   Account",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.blue),),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 65,right: 50),
                      child: Row(
                        children: [
                          Text("Already Registered?",style: TextStyle(fontWeight:FontWeight.normal,fontSize: 10,color: Colors.grey)),
                          login,
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    Text("Name",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    const SizedBox(height: 10),
                    fullNameField,
                    const SizedBox(height: 20),
                    Text("Email",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 20),
                    Text("Password",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    const SizedBox(height: 10),
                    passwordField,
                    const SizedBox(height: 20),
                    Text("Date of Birth",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    const SizedBox(height: 10),
                    dateOfBirthField,
                    const SizedBox(height: 40),
                    signUpButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  final _auth = FirebaseAuth.instance;
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values

    userModel.email = emailEditingController.text;
    userModel.password = passwordEditingController.text;
    userModel.dateOfBorth = datOfBirthController.text;
    userModel.fullName = fullNameEditingController.text;
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .set(userModel.toMapRegistrationDetails());
    Fluttertoast.showToast(msg: "Your account has been created successfully");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
