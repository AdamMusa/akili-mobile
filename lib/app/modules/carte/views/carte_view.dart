// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/carte_controller.dart';
import 'carte_item_view.dart';

class CarteView extends GetView<CarteController> {
  CarteView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(CarteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.productCarte.length,
                  itemBuilder: (context, index) => CarteItemView(
                        product: controller.productCarte[index].obs,
                        index: index,
                      )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 25, right: 25),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Text(
                    "${controller.total.toString()} XAF",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              await controller.faireLaCommande();
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width - 50, 43),
                elevation: 0,
                backgroundColor: Colors.teal.shade700),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lancer la commande",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                // Icon(Icons.switch_access_shortcut_rounded)
                Icon(Icons.rocket_launch_sharp)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
