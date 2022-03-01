class History {
  String? name;
  String? image;
  DateTime? athDate;
  num? marketCap;
  num? currentPrice;

  History({
    this.name,
    this.image,
    this.athDate,
    this.marketCap,
    this.currentPrice,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      name: json["name"],
      image: json["image"],
      athDate: DateTime.parse(json["ath_date"]),
      marketCap: json["market_cap_change_percentage_24h"],
      currentPrice: json["current_price"],
    );
  }
/*
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "ath_date": athDate,
      "market_cap_change_percentage_24h": marketCap,
      "current_price": currentPrice,
    };
  }
  */
}
