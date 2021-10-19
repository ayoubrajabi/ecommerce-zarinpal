import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  final String? status;
  final String? authority;
  final GlobalKey<BeamerState>? beamerKey;

  const CheckoutScreen({
    Key? key,
    @required this.status,
    @required this.authority,
    this.beamerKey,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    final _paymentRequest = context.read<PaymentRequestCubit>().state;
    context
        .read<VerifyPaymentBloc>()
        .add(StartVerify(_paymentRequest, widget.authority, widget.status));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VerifyPaymentBloc, VerifyPaymentState>(
          builder: (context, verifyState) {
            if (verifyState is VerifyIsLoded) {
              return VerifySucsses(
                authority: widget.authority,
                verifyState: verifyState,
                beamerKey: widget.beamerKey,
              );
            } else if (verifyState is VerifyError) {
              return VerifyErrorWidget(
                beamerKey: widget.beamerKey,
              );
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 2.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
