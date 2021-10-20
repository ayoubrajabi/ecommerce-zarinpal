part of '../verify_payment/verify_payment_bloc.dart';

abstract class VerifyPaymentState extends Equatable {
  const VerifyPaymentState();
  @override
  List<Object?> get props => [];
}

class VerifyIsLoding extends VerifyPaymentState {}

class VerifyIsLoded extends VerifyPaymentState {
  final bool? _isPaymentSuccess;
  final String? _refID;
  final num? _amount;

  const VerifyIsLoded(this._isPaymentSuccess, this._refID, this._amount);

  bool? get isPaymentSuccess => _isPaymentSuccess;
  String? get refID => _refID;
  num? get amount => _amount;

  @override
  List<Object?> get props => [_isPaymentSuccess, _refID, _amount];
}

class VerifyError extends VerifyPaymentState {}

class VerifyWithProblem extends VerifyPaymentState {}
