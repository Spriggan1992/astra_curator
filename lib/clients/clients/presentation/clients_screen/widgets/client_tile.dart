import 'package:astra_curator/clients//clients/presentation/clients_screen/constants/clients_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents client's list tile.
class ClientTile extends StatelessWidget {
  const ClientTile({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.dateTime,
    required this.id,
  }) : super(key: key);

  /// Client's name.
  final String name;

  /// Clients last date time.
  final String dateTime;

  /// Client's id.
  final int id;

  /// Client's id.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        dense: true,
        horizontalTitleGap: 4,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage:
              imageUrl.isNotEmpty ? Image.network(imageUrl).image : null,
          backgroundColor: AstraColors.black01,
        ),
        title: Text(
          name,
          style: _textTheme.bodyMedium!.copyWith(
            color: AstraColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${ClientsTexts.lastLogin}: $dateTime',
              style: _textTheme.bodySmall!.copyWith(
                color: AstraColors.black04,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${ClientsTexts.userId}: $id',
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
  }
}
