part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<TshirtModel>? tshirtModel;
  const CartState({this.tshirtModel = const <TshirtModel>[]});

  @override
  List<Object> get props => [tshirtModel!];
}
