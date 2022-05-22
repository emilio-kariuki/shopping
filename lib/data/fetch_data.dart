import 'dart:io';

import "package:http/http.dart" as http;
import 'package:shopping/model/shopping_model.dart';

class Remote {
  static var client = http.Client();
  static Future<List<Shopping>> fetchData() async {
    var response =
        await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      print("Information fetched successfully");
      var json = response.body;
      // print(jsonDecode(json));
      return shoppingFromJson(json);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
