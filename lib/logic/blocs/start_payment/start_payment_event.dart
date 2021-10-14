part of 'start_payment_bloc.dart';

@immutable
abstract class StartPaymentEvent {}

class Start extends StartPaymentEvent {
  PaymentRequest? paymentRequest;
  Start(this.paymentRequest);
}
