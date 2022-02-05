import 'package:bts/utils/app_const.dart';
import 'package:flutter/material.dart';

import 'dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          child: Image.asset(
            "assets/images/spalsh.jpg",
            fit: BoxFit.fill,
          )),
    );
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
  }
}
