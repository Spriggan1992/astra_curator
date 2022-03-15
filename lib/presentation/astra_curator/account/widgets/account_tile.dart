import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Represent history payment list widget.
class AccountTile extends StatelessWidget {
  const AccountTile({
    Key? key,
    required this.name,
    required this.id,
    required this.date,
    required this.money,
    required this.paket,
  }) : super(key: key);

  /// The name of the payer.
  final String name;

  /// The id of the payer.
  final String id;

  /// The pay date.
  final String date;

  /// The sum of the payment.
  final String money;

  /// Paket of the payment.
  final String paket;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Text(
                          name,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        date,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AstraColors.black04,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    id,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AstraColors.black04,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    money,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AstraColors.green,
                        ),
                  ),
                  Text(
                    paket,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AstraColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
