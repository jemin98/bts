import 'package:bts/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:wallpaper/wallpaper.dart';
import 'dart:async';

class FullScreenImage extends StatefulWidget {
  String imageLink;

  FullScreenImage({required this.imageLink});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  final FlareControls flareControls = FlareControls();
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

  Stream<String>? progressString;
  String? res;
  bool downloading = false;
  var result = "Waiting to set wallpaper";
  bool _isDisable = true;

  int nextImageID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed:  () async {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          home = await Wallpaper.homeScreen(
              options: RequestSizeOptions.RESIZE_FIT,
              width: width,
              height: height);
          setState(() {
            downloading = false;
            home = home;
          });
          print("Task Done");
        },
        child: Text("Set Wallpaper"),
      ),
      body: Stack(children: [
        GestureDetector(
          onDoubleTap: () {
            flareControls.play("like");
          },
          child: Container(
            height: height,
            width: width,
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                widget.imageLink,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: height,
          child: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: FlareActor(
                'assets/images/instagram_like.flr',
                controller: flareControls,
                animation: 'idle',
              ),
            ),
          ),
        ),
        
      ]),
    );
  }
}
