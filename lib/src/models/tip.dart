class Tip {
  final String tip;
  final String hexColor;

  Tip({required this.tip, required this.hexColor});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(tip: json['tip'], hexColor: json['hexColor']);
  }
}
