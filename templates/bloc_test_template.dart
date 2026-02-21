// Generic bloc/cubit-test template.
// Copy into test/<feature>/<name>_test.dart and replace TODO markers.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO: declare repository mocks and SUT.
  // late MockExampleRepository repository;
  // late ExampleCubit cubit;

  setUp(() {
    // TODO: initialize shared setup if your repo has one (e.g. TestEnv.registerBaseDependencies()).
    // TODO: initialize/register mocks and create SUT.
  });

  tearDown(() async {
    // TODO: close cubit/bloc and reset DI/singletons if used.
    // await cubit.close();
    // await getIt.reset();
  });

  group('<CubitName>', () {
    blocTest<dynamic, dynamic>(
      'emits <states> when <action>',
      build: () {
        // TODO: stub dependencies and return SUT.
        throw UnimplementedError('Replace with SUT');
      },
      act: (cubit) {
        // TODO: call method under test.
        // Keep act deterministic: avoid Future.delayed(...) here.
      },
      // wait: const Duration(milliseconds: 300), // TODO: use for debounce/timer flows.
      // seed: () => <State>, // TODO: only if non-default initial state is required.
      // skip: 1, // TODO: only if intentionally ignoring intermediate emissions.
      expect:
          () => <dynamic>[
            // TODO: expected states.
          ],
      verify: (_) {
        // TODO: verify side effects/interactions when relevant.
      },
    );
  });
}
