import 'package:bloc/bloc.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  void index(int index) => emit(index);
}
