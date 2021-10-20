import 'package:ecommerce_zarinpal/logic/cubits/cubits.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProvidersList {
  final List<BlocProvider> _blocProviders = [
    BlocProvider<PaymentRequestCubit>(
      create: (_) => PaymentRequestCubit(),
    ),
    BlocProvider<StartPaymentBloc>(
      create: (_) => StartPaymentBloc(),
    ),
    BlocProvider<VerifyPaymentBloc>(
      create: (_) => VerifyPaymentBloc(),
    ),
    BlocProvider<CartBloc>(
      create: (_) => CartBloc(),
    ),
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
