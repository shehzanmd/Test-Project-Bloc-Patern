
class Information {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  Information({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    activity: json["activity"],
    type: json["type"],
    participants: json["participants"],
    price: json["price"]?.toDouble(),
    link: json["link"],
    key: json["key"],
    accessibility: json["accessibility"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
    "accessibility": accessibility,
  };
}
