import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  final String? status;
  final String? authority;

  const CheckoutScreen({
    Key? key,
    @required this.status,
    @required this.authority,
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
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VerifyPaymentBloc, VerifyPaymentState>(
          builder: (context, verifyState) {
            if (verifyState is VerifyIsLoded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('status of payment is:  ${widget.status}'),
                  Text('authority of payment is:  ${widget.authority}'),
                  Text(
                      'authority of payment is:  ${verifyState.isPaymentSuccess}'),
                  Text('authority of payment is:  ${verifyState.refID}'),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('test'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('test2'),
                  ),
                ],
              );
            } else if (verifyState is VerifyError) {
              return const SizedBox(
                child: Center(
                  child: Text('Error In Payment'),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
