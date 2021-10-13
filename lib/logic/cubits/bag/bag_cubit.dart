import 'package:bloc/bloc.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';

class AddToBagCubit extends Cubit<List<TshirtModel>> {
  AddToBagCubit() : super([]);

  void addToBag(TshirtModel tshirtInfo) {
    return emit(state..add(tshirtInfo));
  }

  void deleteFromBag(TshirtModel tshirtInfo) {
    return emit(state..remove(tshirtInfo));
  }
}
