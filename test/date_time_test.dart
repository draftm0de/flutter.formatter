import 'package:draftmode_formatter/formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DraftModeFormatterDateTime.duration', () {
    test('formats date with predefined pattern', () {
      final dateTime = DateTime.utc(2024, 7, 6, 13, 4, 9);
      final formatted = DraftModeFormatterDateTime.duration(
        dateTime,
        pattern: 'YYYYMMDD',
      );

      expect(formatted, '20240706');
    });

    test('supports every documented token', () {
      final dateTime = DateTime(1999, 12, 3, 0, 4, 5);

      final formatted = DraftModeFormatterDateTime.duration(
        dateTime,
        pattern: 'YYYY YY MM DD HH hh mm ss',
      );

      expect(formatted, '1999 99 12 03 00 12 04 05');
    });

    test('keeps literal text untouched', () {
      final dateTime = DateTime(2024, 1, 5, 0, 7, 3);

      final formatted = DraftModeFormatterDateTime.duration(
        dateTime,
        pattern: 'Report YYYY/MM/DD at HH:mm UTC',
      );

      expect(formatted, 'Report 2024/01/05 at 00:07 UTC');
    });

    test('formats date with custom tokens', () {
      final dateTime = DateTime(2024, 1, 5, 0, 7, 3);

      final formatted = DraftModeFormatterDateTime.duration(
        dateTime,
        pattern: 'YYYY/MM/DD hh:mm:ss',
      );

      expect(formatted, '2024/01/05 12:07:03');
    });

    group('12-hour clock token', () {
      test('returns 12 for midnight and noon', () {
        final midnight = DateTime(2024, 1, 1, 0);
        final noon = DateTime(2024, 1, 1, 12);

        expect(
          DraftModeFormatterDateTime.duration(midnight, pattern: 'hh'),
          '12',
        );
        expect(
          DraftModeFormatterDateTime.duration(noon, pattern: 'hh'),
          '12',
        );
      });

      test('wraps afternoon hours back to 12-hour format', () {
        final evening = DateTime(2024, 1, 1, 23, 11);

        final formatted = DraftModeFormatterDateTime.duration(
          evening,
          pattern: 'hh:mm',
        );

        expect(formatted, '11:11');
      });
    });
  });
}
