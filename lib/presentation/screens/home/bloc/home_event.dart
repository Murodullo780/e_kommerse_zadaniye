part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeStartedEvent extends HomeEvent {}

final class ChangeCategoryIndexEvent extends HomeEvent {
  final int index;
  ChangeCategoryIndexEvent({required this.index});
}

final class AddFoodToCartEvent extends HomeEvent {
  final SavedFood food;
  AddFoodToCartEvent({required this.food});
}
