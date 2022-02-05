import 'dart:convert';
import 'dart:developer';

import 'package:bts/model/images_model.dart';
import 'package:http/http.dart' as http;

class getData {
  Future getImage(page,image) async {
    var result = await http.get(Uri.parse(
        "https://bogol.my.id/api/v1/api.php?get_wallpapers&page=$page&count=24&filter=g.cat_id%20%3D%20%27$image%27&order=ORDER%20BY%20g.id%20DESC"));
    log(result.body);
    return ImageData.fromJson(jsonDecode(result.body));
  }
}
