import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lifx/data/lifx_repository.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

part 'lights_state.dart';

class LightsCubit extends Cubit<LightsState> {
  final LifxRepository _lifxRepository;

  LightsCubit(this._lifxRepository) : super(const LightsInitial());

  Future<void> getLights() async {
    try {
      emit(const LightsLoading());
      final bulbs = await _lifxRepository.getBulbs();
      emit(LightsLoaded(bulbs));
    } catch (e) {
      emit(LightsError(e.toString()));
      print(e);
    }
  }
}
