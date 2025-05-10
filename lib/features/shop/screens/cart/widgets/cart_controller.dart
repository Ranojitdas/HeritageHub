import 'package:get/get.dart';

/// ✅ Cart Item Model
class CartItem {
  final String name;
  final double price;
  RxInt quantity; // ✅ Reactive quantity

  static const String quality = "New"; // ✅ Static quality
  static const bool isAvailable = true; // ✅ Static availability

  CartItem({required this.name, required this.price, int quantity = 1})
      : quantity = RxInt(quantity);
}

/// ✅ Cart Controller using GetX
class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs; // ✅ Observable list
  final RxDouble totalPrice = 0.0.obs; // ✅ Observable total price

  /// ✅ Computed total price (auto-updates when quantity changes)
  double get computedTotalPrice => cartItems.fold(
      0.0, (sum, item) => sum + (item.price * item.quantity.value));

  /// ✅ Add item to cart (if exists, increase quantity)
  void addItem(String name, double price) {
    final existingItem = cartItems.firstWhereOrNull((item) => item.name == name);

    if (existingItem != null) {
      existingItem.quantity.value++; // ✅ Update reactive quantity
    } else {
      cartItems.add(CartItem(name: name, price: price)); // ✅ Add new item
    }

    totalPrice.value = computedTotalPrice; // ✅ Auto-update total
  }

  /// ✅ Remove item or decrease quantity
  void removeItem(String name) {
    final existingItem = cartItems.firstWhereOrNull((item) => item.name == name);

    if (existingItem != null) {
      if (existingItem.quantity.value > 1) {
        existingItem.quantity.value--; // ✅ Decrease quantity
      } else {
        cartItems.remove(existingItem); // ✅ Remove if quantity is 1
      }
      totalPrice.value = computedTotalPrice; // ✅ Recalculate total
    }
  }

  /// ✅ Clear entire cart
  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }
}
