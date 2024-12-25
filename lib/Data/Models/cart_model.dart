import 'dart:convert';
import 'dart:typed_data';

import 'package:furnizone/Data/APIs/End_Ponits.dart';


class CartModel {
  List<Content>? content;
  int? number;
  int? size;
  int? totalElements;
  int? totalPages;
  bool? first;
  bool? last;

  CartModel({
    this.content,
    this.number,
    this.size,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.content] != null) {
      content = <Content>[];
      json[ApiKey.content].forEach((v) {
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
  int? itemId;
  String? productName;
  String? category;
  double? price;
  int? quantity;
  Uint8List? image;

  Content({
    this.itemId,
    this.productName,
    this.category,
    this.price,
    this.quantity,
    this.image,
  });

  Content.fromJson(Map<String, dynamic> json) {
    itemId = json[ApiKey.itemId];
    productName = json[ApiKey.productName];
    category = json[ApiKey.category];
    price = json[ApiKey.price];
    quantity = json[ApiKey.quantity];

   image= _decodeBase64(json[ApiKey.image]);

  }

  Uint8List _decodeBase64(String base64String) {
    return base64Decode(base64String);
  }
}
