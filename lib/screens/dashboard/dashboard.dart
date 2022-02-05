import 'dart:convert';
import 'dart:developer';

import 'package:bts/model/images_model.dart';
import 'package:bts/response/services.dart';
import 'package:bts/utils/app_const.dart';
import 'package:bts/utils/color_const.dart';
import 'package:flutter/material.dart';

import 'gridview_image.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  ThemeColors _themeColors = ThemeColors();
  TabController? _controller;
  List imageType = [
    {"title": "BTS❤", "page": 1, "imagesList": [], "id": "18"},
    {"title": "V", "page": 1, "imagesList": [], "id": "19"},
    {"title": "Jin", "page": 1, "imagesList": [], "id": "21"},
    {"title": "Jungkook", "page": 1, "imagesList": [], "id": "17"},
    {"title": "RM", "page": 1, "imagesList": [], "id": "22"},
    {"title": "Jimin", "page": 1, "imagesList": [], "id": "20"},
    {"title": "Suga", "page": 1, "imagesList": [], "id": "24"},
    {"title": "J-Hope", "page": 1, "imagesList": [], "id": "23"},
    {"title": "New Art", "page": 1, "imagesList": [], "id": "25"},
  ];
  ScrollController? _scrollController = ScrollController();
  bool isLoading = true;

  ImageData? _imageData = ImageData();
  int _selectedIndex = 0;

  @override
  void initState() {
    getimage("1", "18");
    _scrollController!.addListener(() {
      if (_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) {
        getimage((imageType[_selectedIndex]["page"] + 1).toString(),
            imageType[_selectedIndex]["id"]);
        setState(() {
          imageType[_selectedIndex]["page"]++;
        });
      }
    });
    _controller = TabController(length: 9, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _themeColors.backGroundColor,
        title: Text("BTS Wallpaper HD"),
      ),
      drawer: Drawer(),
      body: Container(
        margin: EdgeInsets.only(top: height * 0.02),
        child: Column(
          children: [
            TabBar(
              onTap: (value) {
                setState(() {
                  isLoading = true;
                  _selectedIndex = value;
                  if (imageType[_selectedIndex]["page"] == 1) {
                    getimage(imageType[_selectedIndex]["page"],
                        imageType[_selectedIndex]["id"]);
                    imageType[_selectedIndex]["page"]++;
                  }
                });
              },
              controller: _controller,
              indicatorColor: _themeColors.whiteColor,
              padding: EdgeInsets.only(bottom: height * 0.01),
              isScrollable: true,
              tabs: [
                Text(imageType[0]["title"]),
                Text(imageType[1]["title"]),
                Text(imageType[2]["title"]),
                Text(imageType[3]["title"]),
                Text(imageType[4]["title"]),
                Text(imageType[5]["title"]),
                Text(imageType[6]["title"]),
                Text(imageType[7]["title"]),
                Text(imageType[8]["title"]),
              ],
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: _themeColors.whiteColor,
                    ),
                  )
                : Container(
                    height: height * 0.78,
                    width: width,
                    child: TabBarView(controller: _controller, children: [
                      GridViewImage(
                          scrollController: _scrollController!,
                          imageList: imageType[0]["imagesList"]),
                      GridViewImage(
                          scrollController: _scrollController!,
                          imageList: imageType[1]["imagesList"]),
                      GridViewImage(
                          scrollController: _scrollController!,
                          imageList: imageType[2]["imagesList"]),
                      GridViewImage(
                          imageList: imageType[3]["imagesList"],
                          scrollController: _scrollController!),
                      GridViewImage(
                          imageList: imageType[4]["imagesList"],
                          scrollController: _scrollController!),
                      GridViewImage(
                          imageList: imageType[5]["imagesList"],
                          scrollController: _scrollController!),
                      GridViewImage(
                          imageList: imageType[6]["imagesList"],
                          scrollController: _scrollController!),
                      GridViewImage(
                          imageList: imageType[7]["imagesList"],
                          scrollController: _scrollController!),
                      GridViewImage(
                          imageList: imageType[8]["imagesList"],
                          scrollController: _scrollController!),
                    ]),
                  )
          ],
        ),
      ),
    );
  }

  getimage(page, peersonNumber) async {
    await getData().getImage(page, peersonNumber).then((value) {
      return _imageData = value;
    });
    for (var i = 0; i < _imageData!.posts!.length; i++) {
      if (_imageData!.posts![i]["category_name"] == "BTS") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[0]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "V") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[1]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "Jungkook") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[3]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "jimin") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[5]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "jin") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[2]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "rm") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[4]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "jhope") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[7]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "suga") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[6]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      } else if (_imageData!.posts![i]["category_name"] == "fanart") {
        if (_imageData!.posts![i]["image_url"] != null &&
            _imageData!.posts![i]["image_url"] != "") {
          imageType[8]["imagesList"].add(_imageData!.posts![i]["image_url"]);
        }
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
