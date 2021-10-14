part of 'start_payment_bloc.dart';

@immutable
abstract class StartPaymentState {}

class StartPaymentInitial extends StartPaymentState {}

class PaymentIsLoading extends StartPaymentState {}

class PaymentIsLoaded extends StartPaymentState {
  final String? _url;

  PaymentIsLoaded(this._url);

  String? get url => _url!;
}

class PaymentError extends StartPaymentState {}
