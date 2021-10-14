import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zarinpal/zarinpal.dart';

part 'verify_payment_event.dart';
part 'verify_payment_state.dart';

class VerifyPaymentBloc extends Bloc<VerifyPaymentEvent, VerifyPaymentState> {
  VerifyPaymentBloc() : super(VerifyIsLoding()) {
    on<VerifyPaymentEvent>((event, emit) {
      if (event is StartVerify) {
        ZarinPal().verificationPayment(
          event.status!,
          event.authority!,
          event.paymentRequest!,
          (isPaymentSuccess, refID, paymentRequest) => {
            emit(
              VerifyIsLoded(isPaymentSuccess, refID),
            ),
          },
        );
      }
    });
  }
}
