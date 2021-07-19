class Tip {
  final String tip;
  final String hexColor;
  final String id;

  Tip({required this.tip, required this.hexColor, required this.id});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(tip: json['tip'], hexColor: json['hexColor'], id: json['_id']);
  }
}
