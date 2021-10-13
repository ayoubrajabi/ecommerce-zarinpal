import 'package:ecommerce_zarinpal/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  EcommerceApp({Key? key}) : super(key: key);

  final AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appTheme.theme(),
    );
  }
}
