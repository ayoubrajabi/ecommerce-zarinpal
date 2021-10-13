import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavbarCubit, int>(
        builder: (context, navIndex) => IndexedStack(
          index: navIndex,
          children: [
            Container(
              color: Colors.green,
            ),
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
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  final List<IconData>? _itemIcons = [
    IconlyLight.home,
    IconlyLight.heart,
    IconlyLight.bag,
  ];

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
        items: _itemIcons!
            .map(
              (icon) => BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                  ),
                  label: ''),
            )
            .toList(),
      ),
    );
  }
}
