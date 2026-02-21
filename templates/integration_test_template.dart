// Generic Patrol E2E test template.
// Copy into patrol_test/<feature>_test.dart and replace TODO markers.

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'WHEN user completes <flow> THEN <expected outcome>',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.benchmarkLive,
    tags: const ['smoke'],
    ($) async {
      // TODO: launch app and authenticate if needed.
      // Use credentials via --dart-define / .patrol.env:
      // const user = String.fromEnvironment('E2E_USERNAME');
      // const pass = String.fromEnvironment('E2E_PASSWORD');

      // TODO: use page objects from patrol_test/page_objects/.
      // final home = HomePage($);
      // await home.openSettings();

      // TODO: assert user-visible outcome using stable selectors.
      // await $(const Key('settings_title')).waitUntilVisible();
    },
  );
}

// Example page object skeleton:
// class HomePage {
//   HomePage(this.$);
//   final PatrolIntegrationTester $;
//
//   Future<void> openSettings() async {
//     await $(const Key('settings_button')).tap();
//   }
// }
