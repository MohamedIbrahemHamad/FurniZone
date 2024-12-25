//! Model of response of addProduct request (to store prodoct ID)
class Addproductmodel {
  int productId;
  Addproductmodel({
    required this.productId,
  });

  factory Addproductmodel.fromJson(int jsonData) {
    return Addproductmodel(productId: jsonData);
  }
}
