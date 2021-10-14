part of 'verify_payment_bloc.dart';

@immutable
abstract class VerifyPaymentEvent {}

// ignore: must_be_immutable
class StartVerify extends VerifyPaymentEvent {
  final String? status;
  final String? authority;
  PaymentRequest? paymentRequest;
  StartVerify(this.paymentRequest, this.authority, this.status);
}
