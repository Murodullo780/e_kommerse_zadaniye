part of 'food_detail_bloc.dart';

@immutable
sealed class FoodDetailEvent {}

final class FoodDetailStartedEvent extends FoodDetailEvent {
  final String id;

  FoodDetailStartedEvent(this.id);
}
