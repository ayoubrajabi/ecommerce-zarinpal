import 'package:bloc/bloc.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';

class ShowBagCubit extends Cubit<bool> {
  ShowBagCubit() : super(false);

  void showBag(bool bag) => emit(bag);
}

class AddToBagCubit extends Cubit<List<TshirtModel>> {
  AddToBagCubit() : super([]);

  void addToBag(TshirtModel tshirtInfo) {
    state.add(tshirtInfo);

    return emit(state);
  }
}
