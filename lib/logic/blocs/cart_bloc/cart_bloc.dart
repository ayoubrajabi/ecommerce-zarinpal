import 'package:bloc/bloc.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>(_add);
    on<RemoveFromCart>(_remove);
  }
  List<TshirtModel>? tshirts = [];

  Future<void> _add(AddToCart event, Emitter<CartState> emit) async {
    emit(
      CartState(
        tshirtModel: List.from(tshirts!..add(event.tshirtModel!)),
      ),
    );
  }

  Future<void> _remove(RemoveFromCart event, Emitter<CartState> emit) async {
    emit(
      CartState(
        tshirtModel: List.from(tshirts!..remove(event.tshirtModel!)),
      ),
    );
  }
}
