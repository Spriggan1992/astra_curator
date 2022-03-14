import 'package:flutter/material.dart';

import 'package:astra_curator/domain/my_account/models/withdraw/withdraw_history.dart';
import 'package:astra_curator/presentation/core/extensions/date_tim_to_string.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';

/// Table row abstract class.
abstract class ITableRow {
  /// Get table rows to display in the table.
  List<TableRow> getTableRow(BuildContext context) {
    List<TableRow> rows = [];
    final histories = getHistories();

    if (histories.isNotEmpty) {
      _addHeaderForTableRow(rows, context);

      final TextTheme _textTheme = Theme.of(context).textTheme;
      for (var history in histories) {
        final Color color = _getColor(history);
        rows.add(_getTableRow(context, history, color, _textTheme));
      }
    }
    return rows;
  }

  /// Retrieve withdraw history data
  List<WithdrawHistory> getHistories();

  /// Get status color by status.
  Color _getColor(WithdrawHistory withdrawHistory) {
    switch (withdrawHistory.status) {
      case 'Завершено':
        return AstraColors.green;

      case 'Завершен':
        return AstraColors.green;

      case 'Отклонено':
        return AstraColors.errorColor;

      case 'Отклонен':
        return AstraColors.errorColor;

      default:
        return AstraColors.black08;
    }
  }

  void _addHeaderForTableRow(List<TableRow> tableRows, BuildContext context) {
    tableRows.add(_buildTableHeader(context));
  }

  /// Table row.
  @override
  TableRow _getTableRow(BuildContext context, WithdrawHistory withdrawHistory,
      Color color, TextTheme _textTheme) {
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
                  'ID: ${withdrawHistory.id}',
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
            'Дата/ID',
            style: _textTheme.titleSmall!.copyWith(
              color: AstraColors.black04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(
            'Сумма',
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
            'Статус',
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

/// Astra table row.
class AstraTableRow extends ITableRow {
  AstraTableRow({required this.histories});

  /// List of histories.
  final List<WithdrawHistory> histories;

  @override
  List<WithdrawHistory> getHistories() {
    return histories;
  }
}
