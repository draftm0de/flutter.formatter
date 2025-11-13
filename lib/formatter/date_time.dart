/// Lightweight token-based formatter for building deterministic timestamps
/// without pulling in the heavier `intl` dependency.
class DraftModeFormatterDateTime {
  const DraftModeFormatterDateTime._();

  /// Recognizes every supported token. Longer tokens are listed first so the
  /// regexp never partially matches (e.g. `YYYY` before `YY`).
  static final RegExp _tokenMatcher = RegExp('YYYY|YY|MM|DD|HH|hh|mm|ss');

  /// Formats a [DateTime] using the provided [pattern].
  ///
  /// Supported tokens mirror a subset of `intl`'s `DateFormat` implementation:
  /// `YYYY`, `YY`, `MM`, `DD`, `HH`, `hh`, `mm`, `ss`.
  /// Any other character sequence remains untouched, enabling literal text
  /// such as `Report YYYY-MM-DD at HH:mm UTC`.
  static String duration(DateTime value, {required String pattern}) {
    return pattern.replaceAllMapped(
      _tokenMatcher,
      (match) => _resolveDateToken(value, match[0]!),
    );
  }

  /// Resolves a single formatting [token] into the corresponding [DateTime]
  /// component represented as zero-padded text.
  static String _resolveDateToken(DateTime value, String token) {
    switch (token) {
      case 'YYYY':
        return _fourDigits(value.year);
      case 'YY':
        return _twoDigits(value.year % 100);
      case 'MM':
        return _twoDigits(value.month);
      case 'DD':
        return _twoDigits(value.day);
      case 'HH':
        return _twoDigits(value.hour);
      case 'hh':
        final hour = value.hour % 12 == 0 ? 12 : value.hour % 12;
        return _twoDigits(hour);
      case 'mm':
        return _twoDigits(value.minute);
      case 'ss':
        return _twoDigits(value.second);
      default:
        return token;
    }
  }

  /// Pads a number to two digits (e.g. `4 -> 04`).
  static String _twoDigits(int number) => number.toString().padLeft(2, '0');

  /// Pads a number to four digits (e.g. `42 -> 0042`).
  static String _fourDigits(int number) => number.toString().padLeft(4, '0');
}
