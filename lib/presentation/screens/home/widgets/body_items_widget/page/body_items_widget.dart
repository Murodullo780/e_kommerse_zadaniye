import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_zadaniye/data/models/filtered_food_category.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/widgets/body_items_widget/bloc/home_body_items_bloc.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/widgets/body_items_widget/widget/item_widget.dart';

class BodyItemsWidget extends StatelessWidget {
  final String category;
  final String imageUrl;
  final Function(Meals) onItemTap;

  const BodyItemsWidget({
    super.key,
    required this.category,
    required this.imageUrl,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeBodyItemsBloc()
                ..add(HomeBodyItemsStartedEvent(category: category)),
      child: BlocBuilder<HomeBodyItemsBloc, HomeBodyItemsState>(
        builder: (context, state) {
          if (state is HomeBodyItemsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeBodyItemsLoaded) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: CachedNetworkImage(imageUrl: imageUrl)),
                ),
                GridView.builder(
                  // shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: state.meals?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      meals: state.meals![index],
                      onTap: () {
                        onItemTap(state.meals![index]);
                      },
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
