class fetchProduct {
  String? type;
  String? message;
  Data? data;

  fetchProduct({this.type, this.message, this.data});

  fetchProduct.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? imageurl;
  String? type;
  int? price;
  Plant? plant;

  Data({
    this.id,
    this.name,
    this.description,
    this.imageurl,
    this.type,
    this.price,
    this.plant,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageurl = json['imageurl'];
    type = json['type'];
    price = json['price'];
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageurl'] = this.imageurl;
    data['type'] = this.type;
    data['price'] = this.price;
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    return data;
  }
}

class Plant {
  String? id;
  String? name;
  String? description;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.id,
      this.name,
      this.description,
      this.waterCapacity,
      this.sunLight,
      this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['waterCapacity'] = this.waterCapacity;
    data['sunLight'] = this.sunLight;
    data['temperature'] = this.temperature;
    return data;
  }
}
