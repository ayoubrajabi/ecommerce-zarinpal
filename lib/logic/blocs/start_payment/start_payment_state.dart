part of 'start_payment_bloc.dart';

abstract class StartPaymentState extends Equatable {
  const StartPaymentState();

  @override
  List<Object> get props => [];
}

class StartPaymentInitial extends StartPaymentState {}

class PaymentNotStarted extends StartPaymentState {}

class PaymentIsLoading extends StartPaymentState {}

class PaymentIsLoaded extends StartPaymentState {
  final String? _url;

  const PaymentIsLoaded(this._url);

  String? get url => _url!;

  @override
  List<Object> get props => [_url!];
}

class PaymentError extends StartPaymentState {}
