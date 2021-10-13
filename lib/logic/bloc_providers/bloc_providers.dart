import 'package:ecommerce_zarinpal/logic/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProvidersList {
  final List<BlocProvider> _blocProviders = [
    BlocProvider<NavbarCubit>(
      create: (_) => NavbarCubit(),
    ),
    BlocProvider<AddToBagCubit>(
      create: (_) => AddToBagCubit(),
    ),
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
