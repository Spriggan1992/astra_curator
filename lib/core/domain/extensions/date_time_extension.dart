/// Represent [DateTime] converter.
extension DateTimeToString on DateTime {
  /// Convert [DateTime] to string representation time as hours and time.
  String get dateTimeToStringTime => '$hour:${_getMinutes()}';

  String _getMinutes() {
    if (minute < 10) {
      return '0$minute';
    } else {
      return minute.toString();
    }
  }

  /// Returns true if dateTime is today.
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  /// Returns true if dateTime from yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  /// Convert date time to day and mounth.
  String get dateTimeTodayAnMounts {
    String value = '';
    switch (month) {
      case 1:
        value = 'Января';
        break;
      case 2:
        value = 'Февраля';
        break;
      case 3:
        value = 'Марта';
        break;
      case 4:
        value = 'Апреля';
        break;
      case 5:
        value = 'Мая';
        break;
      case 6:
        value = 'Июня';
        break;
      case 7:
        value = 'Июля';
        break;
      case 8:
        value = 'Августа';
        break;
      case 9:
        value = 'Сентября';
        break;
      case 10:
        value = 'Октября';
        break;
      case 11:
        value = 'Ноября';
        break;
      case 12:
        value = 'Декабря';
        break;
    }
    return value;
  }
}
