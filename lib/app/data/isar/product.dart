import 'package:isar/isar.dart';
// part 'product.g.dart';

@collection
class Card {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  List<Product>? products;
}

@collection
class Product {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? nom;
  String? image;
  double? prix = 0;
  double? montant = 0;
  int nombre = 0;
}
