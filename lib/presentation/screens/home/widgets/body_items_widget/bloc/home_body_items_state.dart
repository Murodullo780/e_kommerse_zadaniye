part of 'home_body_items_bloc.dart';

@immutable
sealed class HomeBodyItemsState {}

final class HomeBodyItemsInitial extends HomeBodyItemsState {}

final class HomeBodyItemsLoading extends HomeBodyItemsState {}

final class HomeBodyItemsLoaded extends HomeBodyItemsState {
  final List<Meals>? meals;
  HomeBodyItemsLoaded(this.meals);
}
