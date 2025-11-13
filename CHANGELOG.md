## [Unreleased]
### Added
- Provide a dedicated README that explains the formatter package layout, setup commands, and contribution workflow.

### Breaking
- `DraftModeFormatterDateTime.duration` now expects a `Duration` input and focuses on elapsed-time tokens (`DD`, `HH`, `mm`, `ss`).

### Changed
- Document how the shared DraftMode example shell loads its assets and ensure the example `.gitignore` only tracks source files.
- Add repo-level ignore rules so generated Flutter/PODS artifacts from `example/ios` stay out of version control.
- Summarize the README's example section now that the local `lib/widget/page.dart` scaffold moved into the shared package.
- Expand formatter inline documentation and tests so every supported duration token is covered with behavior-driven specs.

## 0.1.0
- Initial public release of DraftMode Worker
  - Exposes `DraftModeWorker` API to start/cancel iOS background timers.
  - Adds `DraftModeWorkerEvents` broadcast stream for lifecycle updates.
  - Includes Cupertino demo app with numeric duration picker, status banner, and branding header.
  - Provides unit tests (100% coverage) and coverage instructions.
