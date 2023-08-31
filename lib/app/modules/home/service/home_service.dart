import 'package:get/get.dart';
import 'package:resto/app/constant/app_constant.dart';

class HomeService extends GetConnect {
  Future<Response> fetchProducts() async {
    return get('$url/products');
  }

  Future<Response> fetchCategories() async {
    return get('$url/categories');
  }
}
