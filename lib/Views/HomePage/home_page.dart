import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Controller/news_controller.dart';
import '../Widgets/news_card.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  ProductHome({super.key});
  final newsController = Get.put(Result());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: SizedBox(child: Obx(() {
          //obx is to make the widgets observable
          if (newsController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                itemCount: newsController.newsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 400,
                ),
                itemBuilder: (context, index) {
                  return NewsCard(newsController.newsList[index]);
                });
          }
        })));
  }
}
