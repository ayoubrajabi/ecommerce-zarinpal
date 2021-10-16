part of 'start_payment_bloc.dart';

@immutable
abstract class StartPaymentEvent {}

// ignore: must_be_immutable
class Start extends StartPaymentEvent {
  PaymentRequest? paymentRequest;
  Start(this.paymentRequest);
}

class Refresh extends StartPaymentEvent {}
