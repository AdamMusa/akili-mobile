class AbstractChambre {
  String? id;
  List image;
  double prixPasseTemps = 0;
  double prixJournalier = 0;
  String? duree;
  bool isPasseTemps = false;
  bool climatiser = false;

  AbstractChambre({
    required this.id,
    required this.image,
    required this.prixJournalier,
    required this.isPasseTemps,
    required this.climatiser,
    required this.duree,
    required this.prixPasseTemps,
  });
}
