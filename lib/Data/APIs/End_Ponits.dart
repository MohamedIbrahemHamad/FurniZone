// To define the end points of the APIs
class EndPoint {
  static String baseUrl = "https://javapaas-189386-0.cloudclusters.net/api/v1/";
  static String logIn = "auth/login";
  static String register = "auth/register";
  static String forgetpassword = "auth/forgotten-password";
  static String virfyOTP = "auth/verify-token";
  static String resetPassword = "auth/reset-password";
  static String addProduct = 'admin/products';
  static String uploadProductImageEndPoint(id) {
    return "admin/products/$id/image";
  }

  //* delete or update product
  static String editProductEndPoint(id) {
    return "admin/products/$id";
  }

  static String showCartItems = "carts";
  static String userprofile = "users/profile";
  static String uploadprofilepicture = "users/profile-picture";
  static String updatequantity = "carts";
  static String deleteAll = "carts";
  static String deleteItemFromCart(int id) {
    return "carts/$id";
  }

  static String filterProducts = "products/search";
  static String allProducts = "products";
  static String showWishList = "products/wish-list";

  static String AddToWishList(int id) {
    return "products/add-to-wish-list/$id";
  }

  static String DeleteFromWishList(int id) {
    return "products/wish-list/$id";
  }

  static String GetProductDetails(int id) {
    return "products/$id";
  }
  static String CategorizeProducts = "products/category";

  static String addToCart = "carts";
}

class ApiKey {
  static String validationMessage = "validationErrors";
  static String errorMessage = "businessErrorDescription";
  static String email = "email";
  static String password = "password";
  static String confirmPassword = "confirmPassword";
  static String newPassword = "newPassword";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String phone = "phone";
  static String token = "token";
  static String tempToken = "tempToken";
  static String authorities = "authorities";
  static String Authorization = "Authorization";
  static String name = "name";
  static String category = "category";
  static String price = "price";
  static String description = "description";
  static String stockQuantity = "stockQuantity";
  static String file = "file";
//
  static String itemId = "itemId";
  static String productName = "productName";
  static String quantity = "quantity";
  static String image = "image";
  static String content = "content";
  static String number = "number";
  static String size = "size";
  static String totalElements = "totalElements";
  static String totalPages = "totalPages";
  static String first = "first";
  static String last = "last";
  static String authorization = "Authorization";
  static String page = "page";
  static String fullName = "fullName";
  static String profilePicture = "profilePicture";
  static String id = "id";
  static String available = "available";
  static String favorite = "favorite";
}
