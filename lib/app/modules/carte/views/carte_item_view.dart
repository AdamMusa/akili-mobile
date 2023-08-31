// ignore_for_file: must_be_immutable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/app/modules/carte/controllers/carte_controller.dart';
import '../../../data/abstract/product.dart';

class CarteItemView extends StatelessWidget {
  CarteItemView({super.key, required this.product, required this.index});
  var product = AbstractProduct(nombre: 1).obs;
  final controller = Get.find<CarteController>();
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.memory(
        Uint8List.fromList(product.value.image!),
        fit: BoxFit.cover,
        width: 100,
      ),
      subtitle: Text(
        "${product.value.prix.toString()} XAF",
        style: const TextStyle(color: Colors.black87),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (product.value.nombre > 1) {
                product.value.nombre -= 1;
                controller.productCarte[index].nombre = product.value.nombre;
                controller.total.value =
                    controller.total.value - product.value.prix!.toDouble();
                product.refresh();
              }
            },
            highlightColor: Colors.white,
            splashColor: Colors.white,
            icon: Icon(
              Icons.arrow_left_outlined,
              color: Colors.teal.shade700,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Obx(
              () => Text(
                product.value.nombre.toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              product.value.nombre += 1;
              controller.total.value =
                  controller.total.value + product.value.prix!.toDouble();
              controller.productCarte[index].nombre = product.value.nombre;
              product.refresh();
            },
            highlightColor: Colors.white,
            splashColor: Colors.white,
            icon: Icon(
              Icons.arrow_right_outlined,
              color: Colors.teal.shade700,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
