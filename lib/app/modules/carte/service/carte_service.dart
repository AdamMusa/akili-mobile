import 'package:get/get.dart';
import 'package:resto/app/constant/app_constant.dart';

class CarteService extends GetConnect {
  Future<Response> faireLaCommande(data) async {
    return post('$url/commande', data);
  }
}
