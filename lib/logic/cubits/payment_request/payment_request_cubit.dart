import 'package:bloc/bloc.dart';
import 'package:zarinpal/zarinpal.dart';

class PaymentRequestCubit extends Cubit<PaymentRequest> {
  PaymentRequestCubit() : super(PaymentRequest());

  void getPaymentRequest(PaymentRequest paymentRequest) => emit(paymentRequest);
}
