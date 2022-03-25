import 'package:astra_curator/account/domain/models/calendar_range_date.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

/// Represent base component of app calendar.
///
/// Returns null when click close button.
/// Returns [CalendarRangeDate] data when tap [Выбрать] button.
///
/// Recommended to use with the dialogs [showDialog] or [showCupertinoDialog].
class AstraCalendar extends StatefulWidget {
  final CalendarRangeDate rangeDate;
  const AstraCalendar({
    Key? key,
    required this.rangeDate,
  }) : super(key: key);
  @override
  _AstraCalendarState createState() => _AstraCalendarState();
}

class _AstraCalendarState extends State<AstraCalendar> {
  /// Formats that the calendar can display.
  CalendarFormat _calendarFormat = CalendarFormat.month;

  /// Modes that range selection can operate in. Modes can be disabled, toggledOff, toggledOn, enforced.
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date

  /// DateTime that determines which days are currently visible and focused.
  DateTime _focusedDay = DateTime.now();

  /// DateTime that determines which days are currently selected.
  DateTime? _selectedDay;

  /// The start of the selected day range.
  DateTime? _rangeStart;

  /// The end of the selected day range.
  DateTime? _rangeEnd;

  /// The first active day of `TableCalendar`.
  /// Blocks swiping to days before it.
  ///
  /// Days before it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  DateTime kFirstDay = DateTime(
    DateTime.now().year,
    DateTime.now().month - 3,
    DateTime.now().day,
  );

  /// The last active day of `TableCalendar`.
  /// Blocks swiping to days after it.
  ///
  /// Days after it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  DateTime kLastDay = DateTime(
    DateTime.now().year,
    DateTime.now().month + 3,
    DateTime.now().day,
  );

  @override
  void initState() {
    _rangeStart = widget.rangeDate.beginDate;
    _rangeEnd = widget.rangeDate.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 2,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              Text(
                'Календарь',
                style: _textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.router.pop(null);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          Text(
            'Набор начисления за период',
            style: _textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AstraColors.black04,
            ),
          ),
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            locale: 'ru',
            rangeSelectionMode: _rangeSelectionMode,
            headerVisible: true,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextFormatter: (date, locale) {
                return DateFormat.yMMMM(locale).format(date);
              },
              titleTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            calendarStyle: CalendarStyle(
              rangeEndTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              rangeStartTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              disabledTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              weekendTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              defaultTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              outsideTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AstraColors.black03,
              ),
              rangeStartDecoration: const BoxDecoration(
                color: AstraColors.calendarSelectColor,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: const BoxDecoration(
                color: AstraColors.calendarSelectColor,
                shape: BoxShape.circle,
              ),
              rangeHighlightColor: AstraColors.calendarSelectColor,
              todayTextStyle: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AstraColors.black,
                ),
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _rangeStart = null;
                  _rangeEnd = null;
                  _rangeSelectionMode = RangeSelectionMode.toggledOff;
                });
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _focusedDay = focusedDay;
                _rangeStart = start;
                _rangeEnd = end;
                _rangeSelectionMode = RangeSelectionMode.toggledOn;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const Divider(height: 1, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.router.pop(const CalendarRangeDate(isFilled: false));
                },
                child: Text(
                  'Очистить',
                  style: _textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AstraColors.errorColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  final _rangeDate = CalendarRangeDate(
                    beginDate: _rangeStart,
                    endDate: _rangeEnd,
                    isFilled: (_rangeEnd != null && _rangeStart != null)
                        ? true
                        : false,
                  );
                  context.router.pop(_rangeDate);
                },
                child: Text(
                  'Выбрать',
                  style: _textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AstraColors.black03,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
