import 'package:astra_curator/domain/models/calendar_range_date.dart';
import 'package:flutter/material.dart';

import 'package:astra_curator/presentation/core/extensions/date_tim_to_string.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';

/// Display range date from astra calendar.
class PeriodicWidget extends StatelessWidget {
  const PeriodicWidget({
    Key? key,
    required this.rangeDate,
  }) : super(key: key);

  /// Calendar range date.
  final CalendarRangeDate rangeDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: rangeDate.isFilled
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
                  "${rangeDate.beginDate!.dateTimeToddMMyyFormat()} - ${rangeDate.endDate!.dateTimeToddMMyyFormat()}",
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
    );
  }
}
