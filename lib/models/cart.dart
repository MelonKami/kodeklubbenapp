import 'package:scoped_model/scoped_model.dart';

class Cart extends Model {
  List cartItems = [];

  addToCart() {
    cartItems.add(2);
    notifyListeners();
  }
}
