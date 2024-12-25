import 'dart:convert';
import 'dart:typed_data';

import 'package:furnizone/Data/APIs/End_Ponits.dart';



class AllProductsModel {
  List<Content>? content;
  int? number;
  int? size;
  int? totalElements;
  int? totalPages;
  bool? first;
  bool? last;

  AllProductsModel({
    this.content,
    this.number,
    this.size,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  AllProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    number = json[ApiKey.number];
    size = json[ApiKey.size];
    totalElements = json[ApiKey.totalElements];
    totalPages = json[ApiKey.totalPages];
    first = json[ApiKey.first];
    last = json[ApiKey.last];
  }
}

class Content {
  int? id;
  String? name;
  String? category;
  String? description;
  double? price;
  Uint8List? image;
  bool? available;
  bool? favorite;

  Content({
    this.id,
    this.name,
    this.category,
    this.description,
    this.price,
    this.image,
    this.available,
    this.favorite,
  });

  Content.fromJson(Map<String, dynamic> json) {
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
