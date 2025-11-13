# DraftMode Formatter

DraftMode Formatter is a lightweight Dart helper for formatting `Duration` values without pulling in `intl`. It powers the DraftMode worker facade and demo apps by turning elapsed time into predictable strings with a tiny token parser.

## Installation
Add the package to your `pubspec.yaml` and import the facade entry point:

```dart
import 'package:draftmode_formatter/formatter/date_time.dart';
```

## Usage
`DraftModeFormatterDateTime.duration` accepts any positive `Duration` plus a tokenized pattern. Literal text stays untouched, so you can mix placeholders with explanatory strings:

```dart
final eta = DraftModeFormatterDateTime.duration(
  const Duration(days: 2, hours: 3, minutes: 5, seconds: 9),
  pattern: 'ETA DD days HH:mm:ss',
);
// => ETA 02 days 03:05:09
```

Supported tokens:
- `DD`: total days (zero padded to at least two digits)
- `HH`: hours remainder after full days
- `mm`: minutes remainder after full hours
- `ss`: seconds remainder after full minutes

## Project Layout
- `lib/formatter/date_time.dart` — public formatter implementation and inline docs.
- `lib/formatter.dart` — export surface for consumers.
- `test/date_time_test.dart` — behavior-driven coverage for every token and edge case.

## Development Workflow
Run `flutter pub get` (root and `example/` if you embed the demo app) to install dependencies. Use `flutter analyze lib test` to keep Dart style and null safety intact. Execute `flutter test` before submitting changes; when coverage is required, follow up with `flutter test --coverage` and `genhtml coverage/lcov.info -o coverage/html` to produce HTML artifacts. Example-specific workflows continue inside `example/` (`flutter run`, `flutter test`).

## Contributing
Keep code idiomatic: two-space indentation, camelCase members, PascalCase types, and fine-grained widgets. Tests should mirror the `lib/` structure and read like specifications (`'wraps remainder components correctly'`). Pull requests need a summary, analyzer/test evidence, and screenshots or GIFs for UI updates. Mention related issues and highlight risky areas (token parsing, facade behavior) so reviewers can focus their attention.
