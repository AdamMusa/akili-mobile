class AbstractProduct {
  String? id;
  String? nom;
  double? prix = 0;
  int nombre = 1;
  List<int>? image;
  String? numero;

  AbstractProduct(
      {this.id,
      this.image,
      this.nom,
      required this.nombre,
      this.prix,
      this.numero});
}
