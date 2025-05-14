import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerse_zadaniye/core/helpers/database_helper.dart';
import 'package:e_commerse_zadaniye/data/models/saved_food_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});

    on<CartStartedEvent>((event, emit) async {
      emit(CartLoading());
      DatabaseHelper db = DatabaseHelper();
      await db.getSavedFoods().then((value) {
        final int sum = value.fold(
          0,
          (previousValue, element) => previousValue + element.amount,
        ) * 14000;
        emit(CartLoaded(savedFoods: value, sumForPayment: sum));
      });
    });
    on<CartChangeAmountEvent>((event, emit) async {
      DatabaseHelper db = DatabaseHelper();
      await db.updateFoodAmount(event.food.id ?? 1, event.amount);
      add(CartStartedEvent());
    });

    on<CartClearEvent>((event, emit) async {
      DatabaseHelper db = DatabaseHelper();
      await db.deleteAllFoods();
      add(CartStartedEvent());
    });
  }
}
