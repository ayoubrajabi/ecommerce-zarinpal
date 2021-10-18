import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import 'screens.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key, this.beamerKey}) : super(key: key);

  final GlobalKey<BeamerState>? beamerKey;

  static const String path = 'nav-screen';

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
                    // body: _screens![navIndex],
                    body: Beamer(
                      key: beamerKey,
                      routerDelegate: BeamerDelegate(
                        initialPath: MainScreen.path,
                        locationBuilder: BeamerLocationBuilder(
                          beamLocations: [
                            HomeLocation(),
                            CartLocation(),
                            UserLocation(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: CustomNavigationBar(
                  beamerKey: beamerKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        child: BlocBuilder<NavbarCubit, int>(
          builder: (context, navIndex) => BottomNavigationBar(
            backgroundColor: _bottomNavigationTheme.backgroundColor,
            elevation: _bottomNavigationTheme.elevation,
            showSelectedLabels: _bottomNavigationTheme.showSelectedLabels,
            showUnselectedLabels: _bottomNavigationTheme.showUnselectedLabels,
            selectedItemColor: _bottomNavigationTheme.selectedItemColor,
            unselectedItemColor: _bottomNavigationTheme.unselectedItemColor,
            currentIndex: _currentIndex,
            // onTap: (index) => context.read<NavbarCubit>().emit(index),
            onTap: (index) {
              context.read<NavbarCubit>().emit(index);
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

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
