// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:resto/app/data/abstract/categorie.dart';
import 'package:resto/app/data/abstract/product.dart';
import 'package:resto/app/modules/home/service/home_service.dart';

class HomeController extends GetxController {
  final service = Get.put(HomeService());
  var products = <AbstractProduct>[].obs;
  var productCarte = <AbstractProduct>[].obs;
  var categories = [].obs;
  var total = 0.0.obs;
  var index = 0.obs;
  var isCategorie = false.obs;
  var isProduct = false.obs;
  @override
  void onInit() {
    isCategorie.value = true;
    isProduct.value = true;
    service.fetchCategories().then((value) {
      isCategorie.value = false;
      List<AbstractCategorie> tmp = [];

      for (var item in value.body) {
        List<int> image = List.castFrom(item['image']);
        tmp.add(
          AbstractCategorie(
            label: item['label'],
            image: image,
            id: item['id'].toString(),
          ),
        );
      }
      categories.value = tmp;
    });
    service.fetchProducts().then((value) {
      isProduct.value = false;
      List<AbstractProduct> tmp = [];
      for (var item in value.body) {
        List<int> image = List.castFrom(item['image']);
        tmp.add(
          AbstractProduct(
            nombre: item['nombre'],
            image: image,
            id: item['id'].toString(),
            prix: item['prix'],
          ),
        );
      }
      products.value = tmp;
      // carte.data.value = products;
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changedIndex(value) {
    index.value = value;
  }
}
