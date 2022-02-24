import 'package:astra_curator/presentation/core/extensions/date_tim_to_string.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/calendar/astra_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Display range date from astra calendar.
class PeriodicWidget extends StatefulWidget {
  const PeriodicWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PeriodicWidget> createState() => _PeriodicWidgetState();
}

class _PeriodicWidgetState extends State<PeriodicWidget> {
  DateTime? endDate;
  DateTime? beginDate;
  bool isDateChoosen = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCalendarDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: isDateChoosen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Начисление за весь период: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AstraColors.black03,
                        ),
                  ),
                  Text(
                    "${beginDate!.dateTimeToddMMyyFormat()} - ${endDate!.dateTimeToddMMyyFormat()}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AstraColors.black,
                        ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'Начисление за весь период',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AstraColors.black03,
                      ),
                ),
              ),
      ),
    );
  }

  Future<void> showCalendarDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) {
        return AstraCalendar();
      },
    );

    if (result != null) {
      endDate = result.endDate as DateTime;
      beginDate = result.beginDate as DateTime;
      if (beginDate != null && endDate != null) {
        isDateChoosen = true;
        setState(() {});
      }
    }
  }
}
