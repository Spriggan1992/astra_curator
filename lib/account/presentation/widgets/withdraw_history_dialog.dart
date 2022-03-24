import 'package:astra_curator/account/application/withdraw_history/withdraw_history_bloc.dart';
import 'package:astra_curator/account/presentation/widgets/astra_table_row.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_curator/injection.dart';

/// Dialog to display withdraw histories.
class WithdrawHistoryDialog extends StatelessWidget {
  const WithdrawHistoryDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider<WithdrawHistoryBloc>(
      create: (context) => getIt<WithdrawHistoryBloc>()
        ..add(const WithdrawHistoryEvent.loadHistories()),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 2,
        insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 8,
          horizontal: 24,
        ),
        child: Stack(
          children: [
            BlocBuilder<WithdrawHistoryBloc, WithdrawHistoryState>(
              builder: (context, state) {
                if (state.isSuccess) {
                  final rows = AstraTableRow(histories: state.histories)
                      .getTableRow(context);
                  return (rows.isEmpty)
                      ? const Center(
                          child: Text(
                            'Запросов нет',
                            style: TextStyle(color: AstraColors.black04),
                          ),
                        )
                      : Container(
                          constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height - 200),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 50,
                            ),
                            shrinkWrap: true,
                            primary: true,
                            children: [
                              Table(
                                children: rows,
                              ),
                            ],
                          ),
                        );
                } else if (state.isLoading) {
                  return const Center(child: PlatformActivityIndicator());
                } else {
                  return Center(
                    child: Text(
                      'Запросов нет',
                      style: _textTheme.bodyMedium!.copyWith(
                        color: AstraColors.black04,
                      ),
                    ),
                  );
                }
              },
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    Text(
                      'Мои запросы',
                      style: _textTheme.titleMedium!.copyWith(
                        color: AstraColors.black08,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
