part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Categories> categories;
  final int selectedCategoryIndex;
  // final PageController pageController;

  HomeLoaded({
    required this.categories,
    required this.selectedCategoryIndex,
    // required this.pageController,
  });

  HomeLoaded copyWith({
    List<Categories>? categories,
    int? selectedCategoryIndex,
    // PageController? pageController,
  }) {
    return HomeLoaded(
      categories: categories ?? this.categories,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
      // pageController: pageController ?? this.pageController,
    );
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}

final class HomeLoadingItem extends HomeState {}
