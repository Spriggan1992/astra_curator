import 'package:astra_curator/presentation/astra_curator/clients/widgets/sort_popup_menu.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represent client screen.
class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MainAppBar(
        title: 'Клиенты',
        actions: [
          SortPopUpMenu(onSelected: (value) {}),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            const Divider(color: AstraColors.black01),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              dense: true,
              horizontalTitleGap: 4,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: Image.asset('assets/icons/girl.png').image,
                backgroundColor: Colors.red,
              ),
              title: Text(
                'Анастасия Амилина',
                style: _textTheme.bodyMedium!.copyWith(
                  color: AstraColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Посл. вход: 04.05.21 — 12:45',
                    style: _textTheme.bodySmall!.copyWith(
                      color: AstraColors.black04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'ID: 0090243',
                    style: _textTheme.bodySmall!.copyWith(
                      color: AstraColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: AstraColors.black,
                  ),
                ),
                child: const Icon(
                  CupertinoIcons.paperplane,
                  color: AstraColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
