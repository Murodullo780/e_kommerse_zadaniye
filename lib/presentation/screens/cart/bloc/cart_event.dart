part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartStartedEvent extends CartEvent {}

final class CartChangeAmountEvent extends CartEvent {
  final int amount;
  final SavedFood food;

  CartChangeAmountEvent(this.amount, this.food);
}

final class CartClearEvent extends CartEvent {}

