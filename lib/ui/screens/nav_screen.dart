import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import 'screens.dart';

class NavScreen extends StatelessWidget {
  NavScreen({Key? key}) : super(key: key);

  final List<Widget>? _screens = [
    const MainScreen(),
    CartScreen(),
    UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              BlocBuilder<NavbarCubit, int>(
                builder: (context, navIndex) {
                  return Scaffold(
                    body: _screens![navIndex],
                  );
                },
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: CustomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  final _itemIcons = <IconData, IconData>{
    IconlyLight.home: IconlyBold.home,
    IconlyLight.buy: IconlyBold.buy,
    IconlyLight.user: IconlyBold.user_2,
  };

  @override
  Widget build(BuildContext context) {
    final _bottomNavigationTheme = Theme.of(context).bottomNavigationBarTheme;

    return Container(
      height: 75.0,
      width: double.infinity,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(150),
            blurRadius: 30.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(150),
            blurRadius: 30.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BlocBuilder<NavbarCubit, int>(
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
                      icon: Icon(icon),
                      activeIcon: Icon(activIcon),
                      label: '',
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
