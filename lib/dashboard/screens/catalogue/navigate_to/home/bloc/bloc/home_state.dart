import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/model/catalougue.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/model/fakestore_product.dart';

abstract class HomeProductState {}

class InitialHomeProductState extends HomeProductState {}

class LoadingHomeProductState extends HomeProductState {}

class SuccessHomeProductState extends HomeProductState {
  List<ProductList> product;

  SuccessHomeProductState({required this.product});
}

class SuccessCatalougeState extends HomeProductState {
  final List<Datum> data;
  SuccessCatalougeState(this.data);
}

class ErrorHomeProductState extends HomeProductState {}
