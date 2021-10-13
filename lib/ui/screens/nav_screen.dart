import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import 'screens.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<NavbarCubit, int>(
          builder: (context, navIndex) => IndexedStack(
            index: navIndex,
            children: [
              const MainScreen(),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  final _itemIcons = <IconData, IconData>{
    IconlyLight.home: IconlyBold.home,
    IconlyLight.heart: IconlyBold.heart,
    IconlyLight.buy: IconlyBold.buy,
  };

  @override
  Widget build(BuildContext context) {
    final _bottomNavigationTheme = Theme.of(context).bottomNavigationBarTheme;
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, navIndex) => BottomNavigationBar(
        backgroundColor: _bottomNavigationTheme.backgroundColor,
        elevation: _bottomNavigationTheme.elevation,
        showSelectedLabels: _bottomNavigationTheme.showSelectedLabels,
        showUnselectedLabels: _bottomNavigationTheme.showUnselectedLabels,
        selectedItemColor: _bottomNavigationTheme.selectedItemColor,
        unselectedItemColor: _bottomNavigationTheme.unselectedItemColor,
        currentIndex: navIndex,
        onTap: (index) => context.read<NavbarCubit>().emit(index),
        items: _itemIcons
            .map(
              (icon, activIcon) => MapEntry(
                icon,
                BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                    ),
                    activeIcon: Icon(activIcon),
                    label: ''),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
