import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_zadaniye/data/models/saved_food_model.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/bloc/home_bloc.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/widgets/food_detail_widget/page/food_detail_widget.dart';

import '../widgets/body_items_widget/page/body_items_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeStartedEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            final bloc = context.read<HomeBloc>();
            final PageController pageController = PageController();
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size(
                  double.infinity,
                  kToolbarHeight,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: MediaQuery.paddingOf(context).top,
                    left: 8.0,
                    right: 8.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(index);
                        bloc.add(ChangeCategoryIndexEvent(index: index));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                              fontWeight: state.selectedCategoryIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: Colors.black),
                          child:
                              Text(state.categories[index].strCategory ?? ""),
                        ),
                      ),
                    );
                  },
                ),
              ),
              body: PageView.builder(
                itemCount: state.categories.length,
                controller: pageController,
                padEnds: false,
                onPageChanged: (index) {
                  context
                      .read<HomeBloc>()
                      .add(ChangeCategoryIndexEvent(index: index));
                },
                itemBuilder: (context, index) {
                  return BodyItemsWidget(
                    category: state.categories[index].strCategory ?? '',
                    imageUrl: state.categories[index].strCategoryThumb ?? '',
                    onItemTap: (meal) {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => BlocProvider.value(
                          value: bloc,
                          child: FoodDetailWidget(
                            imageUrl:
                                state.categories[index].strCategoryThumb ?? '',
                            id: meal.idMeal ?? "0",
                            onTap: () {
                              Navigator.pop(context);
                              final SavedFood food = SavedFood(
                                title: meal.strMeal ?? "",
                                amount: 1,
                                price: 14000,
                                valyuta: 'sum',
                                imageUrl: meal.strMealThumb ?? "",
                              );
                              bloc.add(AddFoodToCartEvent(food: food));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Товар добавлен в корзину'),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
