import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens.dart';

class NavScreen extends StatelessWidget {
  NavScreen({Key? key, this.beamerKey}) : super(key: key);

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
              Scaffold(
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
