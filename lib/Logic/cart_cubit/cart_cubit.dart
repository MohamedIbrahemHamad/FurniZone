import 'package:bloc/bloc.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/cart_model.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.api) : super(CounterChangeState());
  double totalPrice = 0;
  int numOfProduct = 1;
  int numOfTotal = 1;
  final ApiConsumer api;
  late CartModel cartModel;
  @override
  void onChange(Change<CartState> change) {
    super.onChange(change);
    print(change);
  }

  GetCartItems() async {
    try {
      emit(CartIsLoading());
      final response = await api.get(EndPoint.showCartItems, queryParameters: {
        "page": 0,
        "size": 5,
      });
      cartModel = CartModel.fromJson(response);
      print('elem= ${cartModel.totalElements}');
      if (cartModel.totalElements == 0) {
        emit(NoCartItem());
      } else {
        emit(GetCartItemSuccessfully());
      }
    } on ApiException catch (e) {
      emit(GetCartItemsfailed(errorMessage: e.errModel.errorMessage!));
      print(e.toString());
    }
  }

  UpdateProductQuantity({
    required int itemId,
    required String change,
    required int quantity,
  }) async {
    try {
      if (change == 'Plus') {
        quantity++;
        numOfProduct += 1;
        numOfTotal++;
      } else if (change == 'Minus' && quantity > 1) {
        quantity--;
        numOfProduct -= 1;
      }
      final response =
          await api.patch(EndPoint.updatequantity, queryParameters: {
        "itemId": itemId,
        "quantity": quantity,
      });
      totalPrice = GetCartItems();
    } catch (e) {
      print(e.toString());
    }
  }

  DeleteAll() async {
    emit(CartIsLoading());
    await api.delete(EndPoint.showCartItems);
    GetCartItems();
    try {} catch (e) {
      print(e.toString());
    }
  }

  DeleteItem({required int itemId}) async {
    emit(CartIsLoading());
    await api.delete(EndPoint.deleteItemFromCart(itemId));
    GetCartItems();
    try {} catch (e) {
      print(e.toString());
    }
  }
}
