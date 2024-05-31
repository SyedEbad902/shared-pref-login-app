// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:local_storage_app/screens/home.dart';
import 'package:local_storage_app/screens/login.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // ignore: constant_identifier_names
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(83, 177, 117, 5),
        height: 1000,
        width: 700,
        child: Center(
            child: Text(
          "Welcome!",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white),
        )),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }
}


// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   static const String KEYLOGIN = "login";
//    void initState() {
//     super.initState();
//     // Call whereToGo after the first frame is rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       whereToGo(context as BuildContext);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           color: const Color.fromRGBO(83, 177, 117, 5),
//           child: Center(
//             child: SizedBox(
//               height: 170,
//               width: 170,
//               // child: Image.asset('assets/images/Group 1.png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  
// }

// void whereToGo() async {
//     var sharedPref = await SharedPreferences.getInstance();
//     var isLoggedIn = sharedPref.getBool(SplashScreenState.KEYLOGIN);

//     Timer(const Duration(seconds: 3), () {
//       if (isLoggedIn != null) {
//         if (isLoggedIn) {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Homescreen()));
//         } else {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => LoginPage()));
//         }
//       } else {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => LoginPage()));
//       }
//     });
//   }

