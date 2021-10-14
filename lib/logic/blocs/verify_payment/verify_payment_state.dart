part of '../verify_payment/verify_payment_bloc.dart';

@immutable
abstract class VerifyPaymentState {}

class VerifyIsLoding extends VerifyPaymentState {}

class VerifyIsLoded extends VerifyPaymentState {
  final bool? _isPaymentSuccess;
  final String? _refID;

  VerifyIsLoded(this._isPaymentSuccess, this._refID);

  bool? get isPaymentSuccess => _isPaymentSuccess;
  String? get refID => _refID;
}

class VerifyError extends VerifyPaymentState {}

class VerifyWithProblem extends VerifyPaymentState {}
