part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final TshirtModel? tshirtModel;
  const AddToCart({this.tshirtModel});
}

class RemoveFromCart extends CartEvent {
  final TshirtModel? tshirtModel;
  const RemoveFromCart(this.tshirtModel);
}
