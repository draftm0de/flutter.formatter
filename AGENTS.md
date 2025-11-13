# Repository Guidelines

## Project Structure & Module Organization
Start in the repository root: `lib/` contains the formatter plugin sources, with `lib/worker.dart` exposing the public API and re-exporting `lib/worker/event.dart` for lifecycle hooks. The Flutter facade that consumes this plugin lives next door in `../flutter/flutter`, where teams should import `package:draftmode/worker.dart`. Demo material resides under `example/`, with UI code in `example/lib/main.dart` and `example/lib/page.dart`, plus assets in `example/assets/images/`. Keep related tests beneath `test/`, mirroring the `lib/` paths.

## Build, Test, and Development Commands
Run `flutter pub get` in both the root and `example/` to sync dependencies. `flutter analyze lib example/lib` enforces style and null safety across plugin and demo code. Use `flutter test` at the root for package coverage; switch to `example/` before running `flutter test` there to validate demo flows. When coverage is requested, execute `flutter test --coverage` followed by `genhtml coverage/lcov.info -o coverage/html` to publish HTML artifacts.

## Coding Style & Naming Conventions
Follow standard Dart formatting: two-space indentation, camelCase members, PascalCase types. Favor concise widgets and extract helpers when build methods exceed ~80 lines. Import the plugin via the facade (`package:draftmode/worker.dart`) inside apps to keep the API surface consistent. Comment only when intent is not obvious from the code.

## Testing Guidelines
All tests use Flutter’s `test` package. Name files and groups to mirror their source counterparts (e.g., `test/worker/worker_test.dart`). Individual tests should describe behavior (`'start() sends duration'`). Aim for near-total coverage, especially around event dispatch and platform boundaries, and regenerate LCOV+HTML reports whenever behavior changes.

## Commit & Pull Request Guidelines
Write present-tense, imperative commit messages such as `Add worker event bridge`. PRs must include: a concise summary, `flutter analyze` and `flutter test` output, any coverage deltas, and screenshots or GIFs for UI-visible work. Reference issue IDs or feature tickets, and call out risky areas (native code, lifecycle hooks) so reviewers can focus their attention.
