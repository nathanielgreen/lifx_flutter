import 'package:bloc/bloc.dart';

import 'package:lifx/data/lifx_repository.dart';

class SettingsCubit extends Cubit<String> {
  final LifxRepository _lifxRepository;

  SettingsCubit(String initialState, this._lifxRepository)
      : super(initialState);

  Future<void> initialize() async {
    try {
      final apiKey = await _lifxRepository.getKey();
      if (apiKey != null) {
        emit(apiKey);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> setKey(String key) async {
    try {
      final apiKey = await _lifxRepository.updateKey(key);
      emit(apiKey);
    } catch (e) {
      print(e);
    }
  }
}
