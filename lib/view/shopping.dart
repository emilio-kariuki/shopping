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
        body: Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: GetX<MyController>(builder: (controller) {
        return GridView.builder(
          itemCount: controller.product.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GetX<MyController>(builder: (controller) {
              return Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                child: Column(
                  children: [
                    Text(
                      controller.product[index].title,
                      style: TextStyle(fontSize: 5),
                    ),
                    Text(controller.product[index].description,
                        style: TextStyle(fontSize: 5)),
                    Image.network(
                      controller.product[index].image,
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              );
            });
          },
        );
      }),
    ));
  }
}
