import 'package:bloc/bloc.dart';

class SettingsCubit extends Cubit<String> {
  SettingsCubit(String initialState) : super(initialState);

  void setKey(String key) => emit(key);
}
