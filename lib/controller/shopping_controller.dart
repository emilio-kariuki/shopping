import 'package:get/state_manager.dart';
import 'package:shopping/data/fetch_data.dart';
import 'package:shopping/model/shopping_model.dart';
import "package:flutter/material.dart";
import "package:shopping/data/fetch_data.dart";

class MyController extends GetxController {
  var isLoading = true.obs;
  var product = <Shopping>[].obs;
  var item = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await Remote.fetchData();
      product.value = products;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void addItem() {
    item.value++;
  }
}
