import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerse_zadaniye/core/helpers/database_helper.dart';
import 'package:e_commerse_zadaniye/core/services/api_services.dart';
import 'package:e_commerse_zadaniye/data/models/category_model.dart';
import 'package:dio/dio.dart';
import 'package:e_commerse_zadaniye/data/models/saved_food_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // final PageController pageController = PageController();
    on<HomeStartedEvent>((event, emit) async {
      final repo = ApiService();
      emit(HomeLoading());
      try {
        final value = await repo.get('categories.php');
        emit(
          HomeLoaded(
            selectedCategoryIndex: 0,
            categories: CategoryModel.fromJson(value.data).categories ?? [],
            // pageController: pageController,
          ),
        );
      } on DioException catch (e) {
        print('API xatosi: $e');
        emit(HomeError(message: e.response?.statusMessage ?? ''));
      } catch (e) {
        print('Kutilmagan xato: $e');
        emit(HomeError(message: e.toString()));
      }
    });
    on<ChangeCategoryIndexEvent>((event, emit) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        // pageController.jumpToPage(event.index);
        emit(currentState.copyWith(selectedCategoryIndex: event.index));
      }
    });
    on<AddFoodToCartEvent>((event, emit){
      final databaseHelper = DatabaseHelper();
      databaseHelper.insertFood(event.food);
    });
  }
}
