import 'package:ecommerce_zarinpal/logic/cubits/cubits.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProvidersList {
  final List<BlocProvider> _blocProviders = [
    BlocProvider<NavbarCubit>(
      create: (_) => NavbarCubit(),
    ),
    BlocProvider<AddToBagCubit>(
      create: (_) => AddToBagCubit(),
    ),
    BlocProvider<PaymentRequestCubit>(
      create: (_) => PaymentRequestCubit(),
    ),
    BlocProvider<StartPaymentBloc>(
      create: (_) => StartPaymentBloc(),
    ),
    BlocProvider<VerifyPaymentBloc>(
      create: (_) => VerifyPaymentBloc(),
    ),
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
