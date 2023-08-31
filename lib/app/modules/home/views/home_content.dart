import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/app/modules/carte/controllers/carte_controller.dart';
import '../controllers/home_controller.dart';

class HomeContent extends GetView<HomeController> {
  HomeContent({super.key});
  final carte = Get.put(CarteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Categorie',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => SizedBox(
                height: 110,
                width: double.infinity,
                child: controller.isCategorie.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              // padding: const EdgeInsets.only(left: 10),
                              height: 100,
                              width: 140,
                              child: Image.memory(
                                Uint8List.fromList(
                                  controller.categories[index].image!,
                                ),
                                fit: BoxFit.cover,
                              ),

                              // child: Text("data"),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Tous',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Obx(
                  () => controller.isProduct.value
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 190,
                                      width: 200,
                                      child: Image.memory(
                                        Uint8List.fromList(
                                            controller.products[index].image!),
                                        fit: BoxFit.cover,
                                      ),
                                      // child: Text("data"),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        color: Colors.white.withOpacity(.2),
                                        width: 190,
                                        height: 40,
                                        padding: const EdgeInsets.only(
                                          bottom: 0,
                                          right: 20,
                                          left: 0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                carte.addProductToCarte(
                                                    controller.products[index]);
                                              },
                                              padding: EdgeInsets.zero,
                                              splashColor: Colors.white,
                                              highlightColor: Colors.white,
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Colors.pink,
                                              ),
                                            ),
                                            Text(
                                              "${controller.products[index].prix} XAF",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
