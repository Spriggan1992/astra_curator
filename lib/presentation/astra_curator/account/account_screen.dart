import 'package:astra_curator/application/account/account_bloc.dart';
import 'package:astra_curator/application/account/account_history/account_history_bloc.dart';
import 'package:astra_curator/application/account/withdraw/withdraw_bloc.dart';
import 'package:astra_curator/domain/models/calendar_range_date.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/account_tile.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/money_card.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/periodic_widget.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/withdraw_dialog.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/withdraw_history_dialog.dart';
import 'package:astra_curator/presentation/core/dialogs/snack_bar.dart';
import 'package:astra_curator/presentation/core/extensions/date_tim_to_string.dart';
import 'package:astra_curator/presentation/core/extensions/money_format.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/presentation/core/widgets/calendar/astra_calendar.dart';
import 'package:astra_curator/presentation/core/widgets/global/platform.activity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent account screen.
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  /// Initial range date variable.
  CalendarRangeDate rangeDate = const CalendarRangeDate(isFilled: false);

  /// Text controller for control withdraw amount.
  TextEditingController controller = TextEditingController();

  /// Variable amount to save withdraw amount.
  double _amount = 0;

  @override
  void initState() {
    // context
    //     .read<AccountHistoryBloc>()
    //     .add(const AccountHistoryEvent.loadHistories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountBloc>(
          create: (context) =>
              getIt<AccountBloc>()..add(const AccountEvent.load()),
        ),
      ],
      child: Scaffold(
        appBar: ReusableAppBar(
          title: 'Мой счет',
          actions: [
            IconButton(
              onPressed: () {
                _showCalendarDialog(context);
              },
              icon: const Icon(
                Icons.calendar_today,
                color: AstraColors.black,
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 16, right: 15),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 32),
            BlocConsumer<AccountBloc, AccountState>(
              listener: (context, listenState) {
                if (listenState.isNoConnection) {
                  showSnackBar(context);
                }
              },
              builder: (context, state) {
                _amount = state.account.amount;

                return MoneyCard(
                  money: '${state.account.amount.formattedAmount()} ₽',
                  onTap: (state.account.amount == 0)
                      ? null
                      : () {
                          _showWithdrawDialog(context);
                        },
                  isEnableCard: state.account.amount != 0,
                  onTapMyQwery: () {
                    _showWithdrawHistoryDialog(context);
                  },
                );
              },
            ),
            PeriodicWidget(rangeDate: rangeDate),
            BlocConsumer<AccountHistoryBloc, AccountHistoryState>(
              listener: (context, listenState) {
                if (listenState.isNoConnection) {
                  showSnackBar(context);
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: PlatformActivityIndicator());
                } else {
                  return (state.histories.isEmpty)
                      ? const Center(child: Text('Список пуст.'))
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.histories.length,
                          itemBuilder: (context, index) {
                            final _accountHistory = state.histories[index];

                            return AccountTile(
                              name: _accountHistory.profile,
                              id: 'ID: ${_accountHistory.id}',
                              date: _accountHistory.convertedDateTime
                                  .dateTimeToddMMyyFormat(),
                              money:
                                  '${_accountHistory.amount.formattedAmount()} ₽ ',
                              paket: _accountHistory.paket,
                            );
                          },
                        );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Shows [AstraCalendar] for choice range date.
  Future<void> _showCalendarDialog(BuildContext context) async {
    final result = await showDialog<CalendarRangeDate>(
      context: context,
      builder: (_) {
        return AstraCalendar(rangeDate: rangeDate);
      },
    );

    if (result != null) {
      rangeDate = result;
      if (result.isFilled) {
        context.read<AccountHistoryBloc>().add(
              AccountHistoryEvent.loadHistoriesByPeriod(
                rangeDate: rangeDate,
              ),
            );
      } else {
        context
            .read<AccountHistoryBloc>()
            .add(const AccountHistoryEvent.loadHistories());
      }
    }

    setState(() {});
  }

  /// Shows dialog ui to display withdraw histories.
  Future<void> _showWithdrawHistoryDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const WithdrawHistoryDialog();
      },
    );
  }

  Future<void> _showWithdrawDialog(BuildContext context) async {
    controller.text = _amount.formattedAmount();
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WithdrawDialog(
          controller: controller,
          onSendQwery: () {
            context.read<WithdrawBloc>().add(
                  WithdrawEvent.withdraw(
                    _textToDouble(controller.text),
                  ),
                );
          },
        );
      },
    );
  }

  /// Parse text to double.
  double _textToDouble(String text) {
    try {
      return double.parse(text);
    } catch (e) {
      return 0;
    }
  }
}
