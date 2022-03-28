import 'package:astra_curator/account/domain/models/withdraw/withdraw_history.dart';
import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/extensions/date_tim_to_string.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

/// Table row class.
class AstraTableRow {
  final List<WithdrawHistory> histories;

  AstraTableRow({required this.histories});

  /// Get table rows to display in the table.
  List<TableRow> getTableRow(BuildContext context) {
    final List<TableRow> rows = [];

    if (histories.isNotEmpty) {
      _addHeaderForTableRow(rows, context);

      final TextTheme _textTheme = Theme.of(context).textTheme;
      for (final history in histories) {
        final Color color = _getColor(history);
        rows.add(_getTableRow(context, history, color, _textTheme));
      }
    }
    return rows;
  }

  /// Get status color by status.
  Color _getColor(WithdrawHistory withdrawHistory) {
    switch (withdrawHistory.status) {
      case AppTexts.completedO:
        return AstraColors.green;

      case AppTexts.completed:
        return AstraColors.green;

      case AppTexts.rejectedO:
        return AstraColors.errorColor;

      case AppTexts.rejected:
        return AstraColors.errorColor;

      default:
        return AstraColors.black08;
    }
  }

  void _addHeaderForTableRow(List<TableRow> tableRows, BuildContext context) {
    tableRows.add(_buildTableHeader(context));
  }

  /// Table row.
  TableRow _getTableRow(
    BuildContext context,
    WithdrawHistory withdrawHistory,
    Color color,
    TextTheme _textTheme,
  ) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  withdrawHistory.convertedDateTime.dateTimeToddMMyyFormat(),
                  style: _textTheme.titleSmall!.copyWith(
                    color: AstraColors.black08,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${AppTexts.id.toUpperCase()}: ${withdrawHistory.id}',
                  style: _textTheme.titleSmall!.copyWith(
                    color: AstraColors.black04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text(
              '${withdrawHistory.formattedAmount} ₽',
              textAlign: TextAlign.right,
              style: _textTheme.titleSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text(
              withdrawHistory.status,
              textAlign: TextAlign.right,
              style: _textTheme.titleSmall!.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Creates a header row in a [Table].
  TableRow _buildTableHeader(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TableRow(
      decoration: const BoxDecoration(),
      children: [
        TableCell(
          child: Text(
            AppTexts.dateId,
            style: _textTheme.titleSmall!.copyWith(
              color: AstraColors.black04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(
            AppTexts.sum,
            textAlign: TextAlign.right,
            style: _textTheme.titleSmall!.copyWith(
              color: AstraColors.black04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(
            AppTexts.status,
            textAlign: TextAlign.right,
            style: _textTheme.titleSmall!.copyWith(
              color: AstraColors.black04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
