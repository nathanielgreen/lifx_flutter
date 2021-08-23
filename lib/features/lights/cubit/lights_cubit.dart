import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lifx/data/lights_repository.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

part 'lights_state.dart';


class LightsCubit extends Cubit<LightsState> {
  final LightsRepository _lightsRepository;

  LightsCubit(this._lightsRepository) : super(const LightsInitial());

  Future<void> getLights() async {
    try {
      emit(const LightsLoading());
      final bulbs = await _lightsRepository.getBulbs();
      emit(LightsLoaded(bulbs));
    } catch (e) {
      print(e);
    }
  }
}
