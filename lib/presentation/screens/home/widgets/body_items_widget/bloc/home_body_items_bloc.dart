import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerse_zadaniye/core/services/api_services.dart';
import 'package:e_commerse_zadaniye/data/models/filtered_food_category.dart';

part 'home_body_items_event.dart';

part 'home_body_items_state.dart';

class HomeBodyItemsBloc extends Bloc<HomeBodyItemsEvent, HomeBodyItemsState> {
  HomeBodyItemsBloc() : super(HomeBodyItemsInitial()) {
    on<HomeBodyItemsEvent>((event, emit) {});
    on<HomeBodyItemsStartedEvent>((event, emit) async {
      emit(HomeBodyItemsLoading());
      final repo = ApiService();
      await repo.get('filter.php?c=${event.category}').then((value) {
        final FilteredFoodCategory filteredFoodCategory =
            FilteredFoodCategory.fromJson(value.data);
        emit(HomeBodyItemsLoaded(filteredFoodCategory.meals));
      });
    });
  }
}
