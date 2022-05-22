import "package:flutter/material.dart";
import 'package:shopping/controller/shopping_controller.dart';
import 'package:get/get.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  final shoppingController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<MyController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      child: Column(
                        children: [
                          Text(controller.product[index].title),
                          Text(controller.product[index].description),
                          Image.network(controller.product[index].image)
                        ],
                      ),
                    );
                  },
                ),
              );
            });
      }),
    );
  }
}
