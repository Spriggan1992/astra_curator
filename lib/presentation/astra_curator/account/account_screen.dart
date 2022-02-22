import 'package:astra_curator/presentation/astra_curator/account/widgets/account_tile.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/money_card.dart';
import 'package:astra_curator/presentation/astra_curator/account/widgets/periodic_widget.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';

/// Represent account screen.
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Мой счет',
        onPressed: () {},
        actions: [
          IconButton(
            onPressed: () {},
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
          MoneyCard(
            money: '33 500 ₽',
            onTap: () {},
            isEnableCard: false,
          ),
          const PeriodicWidget(),
          const AccountTile(
            name: 'Анастасия Амилина',
            id: 'ID: 0090243',
            date: '04.04.21',
            money: '+500 ₽ ',
            paket: 'Пакет «+3 лайка»',
          ),
        ],
      ),
    );
  }
}
