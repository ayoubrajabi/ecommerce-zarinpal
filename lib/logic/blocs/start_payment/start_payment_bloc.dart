import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zarinpal/zarinpal.dart';

part 'start_payment_event.dart';
part 'start_payment_state.dart';

class StartPaymentBloc extends Bloc<StartPaymentEvent, StartPaymentState> {
  StartPaymentBloc() : super(PaymentIsLoading()) {
    on<Start>(
      (event, emit) async {
        ZarinPal().startPayment(event.paymentRequest!, (status, paymentUrl) {
          emit(PaymentIsLoaded(paymentUrl));
        });
      },
    );
  }
}
