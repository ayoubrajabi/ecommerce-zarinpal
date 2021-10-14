import 'package:ecommerce_zarinpal/ui/screens/checkout_screen.dart';
import 'package:ecommerce_zarinpal/ui/screens/nav_screen.dart';
import 'package:ecommerce_zarinpal/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

import 'logic/logic.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  EcommerceApp({Key? key}) : super(key: key);

  final AppTheme _appTheme = AppTheme();
  final BlocProvidersList _blocProvidersList = BlocProvidersList();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProvidersList.blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _appTheme.theme(),
        home: StreamBuilder(
          stream: uriLinkStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Uri uri = snapshot.data;
              final status = uri.queryParameters['Status'];
              final authority = uri.queryParameters['Authority'];

              return CheckoutScreen(
                authority: authority,
                status: status,
              );
            } else {
              return const NavScreen();
            }
          },
        ),
      ),
    );
  }
}
