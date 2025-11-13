# DraftMode Formatter

DraftMode Formatter is a lightweight Dart helper for formatting time primitives without pulling in `intl`. It powers the DraftMode worker facade and demo apps by turning `DateTime` values into predictable strings using a tiny token parser.

## Installation
Add the package to your `pubspec.yaml` and import the facade entry point:

```dart
import 'package:draftmode_formatter/formatter/date_time.dart';
```
or the full set via
```dart
import 'package:draftmode_formatter/formatter.dart';
```

## Usage
The `DraftModeFormatterDateTime.duration` method accepts any `DateTime` plus a tokenized pattern. Literal text stays untouched, so you can mix placeholders with explanatory strings:

```dart
final timestamp = DraftModeFormatterDateTime.duration(
  DateTime.utc(2024, 7, 6, 13, 4, 9),
  pattern: 'Report YYYY-MM-DD at HH:mm UTC',
);
// => Report 2024-07-06 at 13:04 UTC
```

Supported tokens: `YYYY`, `YY`, `MM`, `DD`, `HH`, `hh`, `mm`, `ss`. Twelve-hour tokens (`hh`) wrap midnight and noon back to `12` so you can build AM/PM interfaces without extra helpers.

## Project Layout
- `lib/formatter/date_time.dart` — public formatter implementation and inline docs.
- `lib/formatter.dart` — export surface for consumers.
- `test/date_time_test.dart` — behavior-driven coverage for every token.

## Development Workflow
Run `flutter pub get` (root and `example/` if you embed the demo app) to install dependencies. Use `flutter analyze lib test` to keep Dart style and null safety intact. Execute `flutter test` before submitting changes; when coverage is required, follow up with `flutter test --coverage` and `genhtml coverage/lcov.info -o coverage/html` to produce HTML artifacts. Example-specific workflows continue inside `example/` (`flutter run`, `flutter test`).

## Contributing
Keep code idiomatic: two-space indentation, camelCase members, PascalCase types, and fine-grained widgets. Tests should mirror the `lib/` structure and read like specifications (`'supports every documented token'`). Pull requests need a summary, analyzer/test evidence, and screenshots or GIFs for UI updates. Mention related issues and highlight risky areas (token parsing, facade behavior) so reviewers can focus their attention.
