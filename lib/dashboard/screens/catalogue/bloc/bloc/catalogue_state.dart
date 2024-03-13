import 'package:quick_order/dashboard/screens/catalogue/model/catalogue_model.dart';

abstract class CatalogueState {}

class InitialCatalougeState extends CatalogueState {}

class LoadingCatalougeState extends CatalogueState {}

class SuccessCatalougeState extends CatalogueState {
  final List<Catalogue> datas;

  SuccessCatalougeState({required this.datas});
}

class ErrorCatalougeState extends CatalogueState {}
