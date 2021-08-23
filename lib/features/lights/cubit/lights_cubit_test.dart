import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:lifx/data/lights_repository.dart';

import './lights_cubit.dart';

class MockLightsRepository extends Mock implements LightsRepository {}

void main() {
  group('LightsCubit', () {
    late LightsCubit lightsCubit;

    setUp(() {
      final mockLightsRepository = MockLightsRepository();
      when(() => mockLightsRepository.getBulbs())
          .thenAnswer((_) => Future.value([]));

      lightsCubit = LightsCubit(mockLightsRepository);
    });

    test('initial state is an empty list', () {
      expect(lightsCubit.state, const LightsInitial());
    });

    test('lights loaded on getLights()', () async {
      await lightsCubit.getLights();
      expect(lightsCubit.state, const LightsLoaded([]));
    });
  });
}
