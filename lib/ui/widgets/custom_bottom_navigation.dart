import 'package:badges/badges.dart';
import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key, this.beamerKey}) : super(key: key);

  final GlobalKey<BeamerState>? beamerKey;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final _itemIcons = <IconData, IconData>{
    IconlyLight.home: IconlyBold.home,
    IconlyLight.buy: IconlyBold.buy,
    IconlyLight.user: IconlyBold.user_2,
  };

  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey!.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavigationTheme = Theme.of(context).bottomNavigationBarTheme;
    _currentIndex = _beamerDelegate.currentBeamLocation is HomeLocation
        ? 0
        : _beamerDelegate.currentBeamLocation is CartLocation
            ? 1
            : 2;

    return Container(
      height: 75.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(100),
            blurRadius: 30.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(100),
            blurRadius: 30.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BottomNavigationBar(
          backgroundColor: _bottomNavigationTheme.backgroundColor,
          elevation: _bottomNavigationTheme.elevation,
          showSelectedLabels: _bottomNavigationTheme.showSelectedLabels,
          showUnselectedLabels: _bottomNavigationTheme.showUnselectedLabels,
          selectedItemColor: _bottomNavigationTheme.selectedItemColor,
          unselectedItemColor: _bottomNavigationTheme.unselectedItemColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            _beamerDelegate.beamToNamed(
              index == 0
                  ? MainScreen.path
                  : index == 1
                      ? CartScreen.path
                      : UserScreen.path,
            );
          },
          items: _itemIcons
              .map(
                (icon, activIcon) => MapEntry(
                  icon,
                  BottomNavigationBarItem(
                    icon: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return Badge(
                          badgeColor: Colors.white38,
                          badgeContent: Text(
                            state.tshirtModel!.length.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          elevation: 0.0,
                          showBadge: icon == IconlyLight.buy &&
                              state.tshirtModel!.isNotEmpty,
                          padding: const EdgeInsets.all(7.0),
                          position: const BadgePosition(
                            start: 20.0,
                            bottom: 0.0,
                          ),
                          child: Icon(icon),
                        );
                      },
                    ),
                    activeIcon: Icon(activIcon),
                    label: '',
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
