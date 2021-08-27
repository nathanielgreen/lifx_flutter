part of 'lights_cubit.dart';

class LightsState extends Equatable {
  final List<Bulb> lights;

  const LightsState(this.lights);

  LightsState copyWith({
    List<Bulb>? lights,
  }) {
    return LightsState(
      lights ?? this.lights,
    );
  }

  @override
  List<Object> get props => [lights];
}

class LightsInitial extends LightsState {
  const LightsInitial() : super(const []);
}

class LightsLoading extends LightsState {
  const LightsLoading() : super(const []);
}

class LightsLoaded extends LightsState {
  const LightsLoaded(List<Bulb> lights) : super(lights);
}

class LightsUpdated extends LightsState {
  const LightsUpdated(List<Bulb> lights) : super(lights);
}

class LightsError extends LightsState {
  final String message;
  const LightsError(this.message) : super(const []);
}
