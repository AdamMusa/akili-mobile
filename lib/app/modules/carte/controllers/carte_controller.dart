// ignore_for_file: unnecessary_overrides
import 'package:get/get.dart';
import 'package:resto/app/modules/carte/service/carte_service.dart';
import '../../../data/abstract/product.dart';

class CarteController extends GetxController {
  var productCarte = <AbstractProduct>[].obs;
  var total = 0.0.obs;
  final service = Get.put(CarteService());
  @override
  void onInit() {
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

  addProductToCarte(AbstractProduct product) {
    bool exist = false;

    for (var el in productCarte) {
      if (el.id == product.id) {
        el.nombre += 1;
        exist = true;
        total.value = total.value + el.prix!.toDouble();
        productCarte.refresh();
      }
    }

    if (exist == false) {
      total.value = total.value + product.prix!.toDouble();
      productCarte.add(product);
    }
  }

  faireLaCommande() async {
    List payload = [];
    for (var item in productCarte) {
      payload.add({
        "idImage": item.id,
        "nombre": item.nombre,
        "prix": item.prix,
        "numero": item.numero
      });
    }
    await service.faireLaCommande({"products": payload});
  }
}
