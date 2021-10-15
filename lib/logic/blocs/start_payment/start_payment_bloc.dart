import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zarinpal/zarinpal.dart';

part 'start_payment_event.dart';
part 'start_payment_state.dart';

class StartPaymentBloc extends Bloc<StartPaymentEvent, StartPaymentState> {
  StartPaymentBloc() : super(PaymentNotStarted()) {
    on<Start>(_start);
  }
}

Future<void> _start(
    StartPaymentEvent event, Emitter<StartPaymentState> emit) async {
  if (event is Start) {
    emit(PaymentIsLoading());
    return ZarinPal().startPayment(event.paymentRequest!, (status, paymentUrl) {
      if (status == 100) {
        emit(PaymentIsLoaded(paymentUrl));
      } else {
        emit(PaymentError());
      }
    });
  }
}
