import 'package:bloc/bloc.dart';

import 'package:lifx/data/settings_repository.dart';

class SettingsCubit extends Cubit<String> {
  final SettingsRepository _settingsRepository;

  SettingsCubit(String initialState, this._settingsRepository)
      : super(initialState);

  Future<void> initialize() async {
    try {
      final apiKey = await _settingsRepository.getKey();
      emit(apiKey);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setKey(String key) async {
    try {
      final apiKey = await _settingsRepository.updateKey(key);
      emit(apiKey);
    } catch (e) {
      print(e);
    }
  }
}
