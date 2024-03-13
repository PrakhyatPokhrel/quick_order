import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/model/fakestore_product.dart';

abstract class HomeProductEvent {}

class InitialHomeProductEvent extends HomeProductEvent {}

class FetchApIEvent extends HomeProductEvent {}

class FetchApiCatalogueEvent extends HomeProductEvent {}

class AddToCartClickEvent extends HomeProductEvent {
  Product addtocart;

  AddToCartClickEvent({required this.addtocart});
}

class AddToFavouriteClickEvent extends HomeProductEvent {
  Product addtofavourite;

  AddToFavouriteClickEvent({required this.addtofavourite});
}
