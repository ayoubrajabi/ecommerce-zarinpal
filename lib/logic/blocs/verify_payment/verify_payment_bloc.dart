import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zarinpal/zarinpal.dart';

part 'verify_payment_event.dart';
part 'verify_payment_state.dart';

class VerifyPaymentBloc extends Bloc<VerifyPaymentEvent, VerifyPaymentState> {
  VerifyPaymentBloc() : super(VerifyIsLoding()) {
    on<StartVerify>(_verify);
  }
}

Future<void> _verify(
    VerifyPaymentEvent event, Emitter<VerifyPaymentState> emit) async {
  if (event is StartVerify) {
    return ZarinPal().verificationPayment(
      event.status!,
      event.authority!,
      event.paymentRequest!,
      (isPaymentSuccess, refID, paymentRequest) => {
        if (isPaymentSuccess)
          emit(VerifyIsLoded(isPaymentSuccess, refID))
        else
          emit(VerifyError())
      },
    );
  }
}
