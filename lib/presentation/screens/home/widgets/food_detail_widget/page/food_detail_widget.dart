import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_zadaniye/core/utils/app_colors.dart';
import 'package:e_commerse_zadaniye/data/models/food_detail_model.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/widgets/food_detail_widget/bloc/food_detail_bloc.dart';
import 'package:e_commerse_zadaniye/presentation/widgets/custom_main_button.dart';

class FoodDetailWidget extends StatelessWidget {
  final String imageUrl;
  final String id;
  final Function() onTap;

  const FoodDetailWidget(
      {super.key,
      required this.imageUrl,
      required this.id,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailBloc()..add(FoodDetailStartedEvent(id)),
      child: BlocBuilder<FoodDetailBloc, FoodDetailState>(
        builder: (context, state) {
          if (state is FoodDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FoodDetailLoaded) {
            final FoodDetailMeals? meals = state.foodDetailModel.meals?[0];
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size(double.maxFinite, kToolbarHeight),
                child: Center(
                    child: Text(
                  meals?.strMeal ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                )),
              ),
              body: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Center(child: CachedNetworkImage(imageUrl: imageUrl)),
                  const SizedBox(height: 16),
                  Text(
                    meals?.strInstructions ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 16 + MediaQuery.paddingOf(context).bottom,
                ),
                child: CustomMainButton(
                  text: '+ 14 000 sum',
                  onTap: () => onTap(),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
