import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/favourites/bloc/bloc/favourites_event.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/favourites/bloc/bloc/favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(InitialFavouritesState()) {
    on<FavouritesEvent>((event, emit) {});
    on<AddToFavouriteClickEvent>(
        (event, emit) => addToFavouriteClickEvent(event, emit));
  }

  addToFavouriteClickEvent(
      AddToFavouriteClickEvent event, Emitter<FavouritesState> emit) {}
}
