import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:lifx/data/lifx_repository.dart';

import './settings_cubit.dart';

class MockLifxRepository extends Mock implements LifxRepository {}

void main() {
  group('SettingsCubit', () {
    late SettingsCubit settingsCubit;

    setUp(() {
      final mockLifxRepository = MockLifxRepository();
      settingsCubit = SettingsCubit('', mockLifxRepository);
    });

    test('initial state is empty string', () {
      expect(settingsCubit.state, '');
    });

    blocTest(
      'emits the changed key when setKey is called',
      build: () => settingsCubit,
      act: (SettingsCubit cubit) => cubit.setKey('TEST_KEY'),
      expect: () => ['TEST_KEY'],
    );
  });
}
