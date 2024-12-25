import 'dart:convert';
import 'dart:typed_data';

import 'package:furnizone/Data/APIs/End_Ponits.dart';



class ProductDetailsModel {
  int? id;
  String? name;
  String? category;
  String? description;
  double? price;
  Uint8List? image;
  bool? available;
  bool? favorite;

  ProductDetailsModel(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.price,
      this.image,
      this.available,
      this.favorite});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.id];
    name = json[ApiKey.name];
    category = json[ApiKey.category];
    description = json[ApiKey.description];
    price = json[ApiKey.price];
    available = json[ApiKey.available];
    favorite = json[ApiKey.favorite];
    image = _decodeBase64(json[ApiKey.image]);
  }

  Uint8List _decodeBase64(String base64String) {
    return base64Decode(base64String);
  }
}
