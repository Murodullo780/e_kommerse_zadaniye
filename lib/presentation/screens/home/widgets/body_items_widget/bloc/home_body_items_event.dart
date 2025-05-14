part of 'home_body_items_bloc.dart';

@immutable
sealed class HomeBodyItemsEvent {}

final class HomeBodyItemsStartedEvent extends HomeBodyItemsEvent {
  final String category;

  HomeBodyItemsStartedEvent({required this.category});
}
