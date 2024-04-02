import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quick_order/dashboard/screens/catalogue/bloc/bloc/catalogue_event.dart';
import 'package:quick_order/dashboard/screens/catalogue/bloc/bloc/catalogue_state.dart';
import 'package:quick_order/dashboard/screens/catalogue/model/catalogue_model.dart';

class CatalogueBloc extends Bloc<CatalogueEvent, CatalogueState> {
  CatalogueBloc() : super(InitialCatalougeState()) {
    on<InitialCatalogueEvent>((event, emit) {
      initialCatalogueEvent(event, emit);
    });
  }

  void initialCatalogueEvent(
      InitialCatalogueEvent event, Emitter<CatalogueState> emit) async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://192.168.1.88:8000/api/catalogs",
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        Catalogue pr = Catalogue.fromJson(jsonResponse);

        List<Datum> datas = pr.data;
        print(datas);

        // emit(SuccessCatalougeState(datas));
      } else {
        emit(ErrorCatalougeState());
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      emit(ErrorCatalougeState());
    }
  }
}
