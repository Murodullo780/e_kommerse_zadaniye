part of 'food_detail_bloc.dart';

@immutable
abstract class FoodDetailState {}

class FoodDetailInitial extends FoodDetailState {}

class FoodDetailLoading extends FoodDetailState {}

class FoodDetailLoaded extends FoodDetailState {
  final FoodDetailModel foodDetailModel;

  FoodDetailLoaded({required this.foodDetailModel});
}

class FoodDetailError extends FoodDetailState {
  final String message;

  FoodDetailError({required this.message});
}
