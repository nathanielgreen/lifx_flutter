import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

import 'package:lifx/data/lifx_repository.dart';

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

  Future<void> updateBrightness(String id, double brightness) async {
    try {
      final bulbs =
          await _lifxRepository.updateLight(id, brightness: brightness);
    } catch (e) {
      emit(LightsError(e.toString()));
      print(e);
    }
  }

  Future<void> togglePower(String id, bool power) async {
    try {
      final powerAsString = power ? "on" : "off";
      await _lifxRepository.updateLight(id, power: powerAsString);
      final bulbs = await _lifxRepository.getBulbs();
      emit(LightsUpdated(bulbs));
    } catch (e) {
      emit(LightsError(e.toString()));
      print(e);
    }
  }

  @override
  void onChange(Change<LightsState> change) {
    var logger = Logger(
      filter: null, // Use the default LogFilter (-> only log in debug mode)
      printer: PrettyPrinter(
          errorMethodCount:
              8, // number of method calls if stacktrace is provided
          lineLength: 40, // width of the output
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ), // Use the PrettyPrinter to format and print log
      output: null, // Use the default LogOutput (-> send everything to console)
    );
    logger.d(change);
    super.onChange(change);
  }
}
