import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quick_order/api_services/http.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_event.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_state.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/model/catalougue.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/model/fakestore_product.dart';

class HomeProductBloc extends Bloc<HomeProductEvent, HomeProductState> {
  List<Product> receiveCartProduct = [];
  List<Product> receiveFavouriteProducts = [];
  HomeProductBloc() : super(InitialHomeProductState()) {
    on<InitialHomeProductEvent>((event, emit) {});

    on<FetchApIEvent>((event, emit) => fetchApIEvent(event, emit));
    on<FetchApiCatalogueEvent>(
        (event, emit) => fetchApiCatalogueEvent(event, emit));
    on<AddToCartClickEvent>((event, emit) => addToCartClickEvent(event, emit));
    on<AddToFavouriteClickEvent>(
        (event, emit) => addToFavouriteClickEvent(event, emit));
  }

  fetchApIEvent(FetchApIEvent event, Emitter<HomeProductState> emit) async {
    try {
      var response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = await jsonDecode(response.body);
        List<ProductList> list = [];

        list.add(ProductList.fromJson(jsonResponse));

        // print(list[0].products);

        emit(SuccessHomeProductState(product: list));
      }
    } catch (err) {
      emit(ErrorHomeProductState());
    }
  }

  fetchApiCatalogueEvent(
      FetchApiCatalogueEvent event, Emitter<HomeProductState> emit) async {
    try {
      var response = await http.get(
        Uri.parse("${ApiServices.base_url}"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = await jsonDecode(response.body);
        CatalogueProductModel catalogueProductModel =
            CatalogueProductModel.fromJson(jsonMap);
        List<Datum> datas = catalogueProductModel.data;
        emit(SuccessCatalougeState(datas));
      }
    } catch (err) {
      emit(ErrorHomeProductState());
    }
  }

  addToCartClickEvent(
      AddToCartClickEvent event, Emitter<HomeProductState> emit) {
    receiveCartProduct.add(event.addtocart);
  }

  addToFavouriteClickEvent(
      AddToFavouriteClickEvent event, Emitter<HomeProductState> emit) {
    receiveFavouriteProducts.add(event.addtofavourite);
  }
}
