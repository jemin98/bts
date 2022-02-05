import 'package:bts/utils/app_const.dart';
import 'package:flutter/material.dart';

import 'fullScreen_image.dart';

class GridViewImage extends StatefulWidget {
  List imageList;
  ScrollController scrollController;

  GridViewImage({required this.imageList, required this.scrollController});

  @override
  _GridViewImageState createState() => _GridViewImageState();
}

class _GridViewImageState extends State<GridViewImage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: widget.scrollController,
      padding: EdgeInsets.only(
          left: width * 0.02, right: width * 0.02, top: height * 0.005),
      itemCount: widget.imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) => Hero(
        tag: 'imageHero',
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(
                          imageLink: widget.imageList[index],
                        ),
                      ));
                },
                child: Image.network(
                  widget.imageList[index],
                  fit: BoxFit.fill,
                ),
              ),
            )),
      ),
    );
  }
}
