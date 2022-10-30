import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_way/screens/dashboard_screen.dart';
import 'package:find_your_way/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
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
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: const TextStyle(
            color: Colors.grey,
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
        controller: passwordController,
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
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: null,
            fontStyle: FontStyle.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Login In",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    //forget password
    final forgetPassword = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/forgetPassword');
      },
      child: const Text(
        '\nForget Password?',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
    //forget password
    final signUp = GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
      },
      child: const Text(
        'Signup',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Find Your Way",style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Image(image: AssetImage("assets/images/glasses.PNG")),
              Column(
                children: [
                  emailField,
                  SizedBox(
                    height: 10,
                  ),
                  passwordField,
                  SizedBox(height: 10),
                  loginButton,
                  SizedBox(height: 10,),
                  forgetPassword,
                ],
              ),
              Row(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Don't have an account? ",style: TextStyle(
                        color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
                  ),
                  signUp,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // login function
  void signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
      Fluttertoast.showToast(msg: "Login Successful"),
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen())),
    })
        .catchError((e) {
      Fluttertoast.showToast(msg: "Login is not successful");
    });
  }

}
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final emailController = TextEditingController();
  late AnimationController controller;
  late Animation<double> animation;

  Future<void> resetPassword(String email) async {
    if (emailController.text.isNotEmpty) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      Fluttertoast.showToast(msg: "Check Email");
    } else {
      Fluttertoast.showToast(msg: "You have entered wrong email");
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Email Here",
        hintStyle: const TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text("Reset Password"),
        ),
      ),
      body: Column(
        children: [
          emailField,
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  resetPassword(emailController.text);
                },
                child: const Text(
                  "Login In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
        ],
      ),
    );
  }
}