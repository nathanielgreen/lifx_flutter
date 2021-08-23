import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import './settings_cubit.dart';

void main() {
  group('SettingsCubit', () {
    late SettingsCubit settingsCubit;

    setUp(() {
      settingsCubit = SettingsCubit('');
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
