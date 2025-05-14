part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<SavedFood> savedFoods;
  final int sumForPayment;

  CartLoaded({required this.savedFoods, required this.sumForPayment});
}
