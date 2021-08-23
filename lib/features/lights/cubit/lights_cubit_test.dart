import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:lifx/data/lights_repository.dart';

import './lights_cubit.dart';

class MockLightsRepository extends Mock implements LightsRepository {}

final mockBulb = Bulb(
  uuid: 'uuid',
  id: 'id',
  label: 'Mock Bulb',
  connected: true,
  group: Group(id: 'group-id', name: 'Mock Group'),
  brightness: 100,
  power: 'on',
  color: LifxColor(hue: 1.0, saturation: 1.0, kelvin: 2000),
);

void main() {
  group('LightsCubit', () {
    late LightsCubit lightsCubit;

    setUp(() {
      final mockLightsRepository = MockLightsRepository();
      when(() => mockLightsRepository.getBulbs())
          .thenAnswer((_) => Future.value([mockBulb]));

      lightsCubit = LightsCubit(mockLightsRepository);
    });

    test('initial state is an empty list', () {
      expect(lightsCubit.state, const LightsInitial());
    });

    test('lights loaded on getLights()', () async {
      await lightsCubit.getLights();
      expect(lightsCubit.state, LightsLoaded([mockBulb]));
    });
  });
}
