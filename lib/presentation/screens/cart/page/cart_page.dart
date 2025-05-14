import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_zadaniye/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:e_commerse_zadaniye/presentation/screens/cart/widget/item_action_buttons.dart';
import 'package:e_commerse_zadaniye/presentation/screens/cart/widget/sum_for_payment_widget.dart';
import 'package:e_commerse_zadaniye/presentation/widgets/custom_main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(CartStartedEvent()),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final bloc = context.read<CartBloc>();
            return Scaffold(
              appBar: AppBar(
                title: const Text("Корзина"),
                actions: [
                  IconButton(
                    onPressed: () {
                      if (state.savedFoods.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Очистить корзину",
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'Вы уверены, что хотите очистить корзину?',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 2 -
                                          70,
                                      child: CustomMainButton(
                                        text: 'Нет',
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 2 -
                                          70,
                                      child: CustomMainButton(
                                        text: 'Да',
                                        color: Colors.black12,
                                        textColor: Colors.black,
                                        onTap: () {
                                          bloc.add(CartClearEvent());
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Корзина пуста")),
                        );
                      }
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              body:
                  state.savedFoods.isEmpty
                      ? Center(
                        child: Column(
                          spacing: 26,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/luna.svg'),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 4,
                              children: [
                                Text(
                                  'Список пуст',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'У вас нет товаров в корзине',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      : ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900.withAlpha(50),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListView.separated(
                              padding: const EdgeInsets.all(16),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  spacing: 8,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            state.savedFoods[index].imageUrl,
                                        width: 56,
                                        height: 56,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width -
                                          260,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.savedFoods[index].title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${state.savedFoods[index].price} '
                                            '${state.savedFoods[index].valyuta}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        ItemActionButtons(
                                          onTap: () {
                                            bloc.add(
                                              CartChangeAmountEvent(
                                                state.savedFoods[index].amount -
                                                    1,
                                                state.savedFoods[index],
                                              ),
                                            );
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        ItemActionButtons(
                                          onTap: () {},
                                          hasBg: false,
                                          child: Text(
                                            "${state.savedFoods[index].amount}",
                                          ),
                                        ),
                                        ItemActionButtons(
                                          onTap: () {
                                            bloc.add(
                                              CartChangeAmountEvent(
                                                state.savedFoods[index].amount +
                                                    1,
                                                state.savedFoods[index],
                                              ),
                                            );
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (context, index) => const Divider(),
                              itemCount: state.savedFoods.length,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900.withAlpha(50),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              spacing: 12,
                              children: [
                                SumForPaymentWidget(
                                  title:
                                      'Товары, ${state.savedFoods.length} шт.',
                                  sum: state.sumForPayment,
                                ),
                                const SumForPaymentWidget(
                                  title: 'Скидка',
                                  sum: 0,
                                ),
                                const Divider(),
                                SumForPaymentWidget(
                                  title: 'Итого',
                                  sum: state.sumForPayment,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            );
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
