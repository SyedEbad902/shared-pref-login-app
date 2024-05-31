import 'package:flutter/material.dart';
import 'package:local_storage_app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(83, 177, 117, 5),
          toolbarHeight: 60,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Home",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                IconButton(
                  onPressed: () async {
                    var sharedpref = await SharedPreferences.getInstance();

                    sharedpref.setBool(SplashScreenState.KEYLOGIN, false);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          leadingWidth: 500,
        ),
      ),
    );
  }
}
