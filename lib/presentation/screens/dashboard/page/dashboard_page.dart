import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerse_zadaniye/core/utils/app_assets.dart';
import 'package:e_commerse_zadaniye/core/utils/app_colors.dart';
import 'package:e_commerse_zadaniye/presentation/screens/cart/page/cart_page.dart';
import 'package:e_commerse_zadaniye/presentation/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:e_commerse_zadaniye/presentation/screens/home/page/home_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<Widget> screens = [
    const HomePage(),
    const CartPage(),
  ];

  Widget bottomItem({String icon = '', required bool isSelected}) {
    return SvgPicture.asset(
      icon,
      color: isSelected ? AppColors.primary : AppColors.inactive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, int>(
          builder: (context, selectedIndex) {
            return screens[selectedIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<DashboardCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                context.read<DashboardCubit>().changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: bottomItem(
                    icon: AppAssets.yedaIcon,
                    isSelected: selectedIndex == 0,
                  ),
                  label: 'Еда',
                ),
                BottomNavigationBarItem(
                  icon: bottomItem(
                    icon: AppAssets.menuIcon,
                    isSelected: selectedIndex == 1,
                  ),
                  label: 'Корзина',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
