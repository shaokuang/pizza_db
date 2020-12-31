class PizzaModel {

  int id;
  String name;
  num rating;
  num pricing;
  String brand;
  String notes;
  num timeToCook;
  String reviewDate;
  String tags;
  String picture;

  PizzaModel({this.id, this.name, this.rating, this.pricing, this.brand, this.notes, this.timeToCook, this.reviewDate, this.tags, this.picture});

  factory PizzaModel.fromJson(dynamic json){
    return PizzaModel(
      id: json['id'],
      name: "${json['name']}",
      rating: json['rating'],
      pricing: json['pricing'],
      brand: "${json['brand']}",
      notes: "${json['notes']}",
      timeToCook: json['time_to_cook'],
      reviewDate: "${json['review_date']}",
      tags: "${json['tags']}",
      picture: "${json['picture']}",

    );
  }

  Map toJson() => {
    "id": id,
    "name": name,
    "rating": rating,
    "pricing": pricing,
    "brand": brand,
    "notes": notes,
    "time_to_cook": timeToCook,
    "review_date": reviewDate,
    "tags": tags,
    "picture": picture
  };

}