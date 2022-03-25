import 'package:astra_curator/account/presentation/constants/account_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_borderred_button.dart';
import 'package:flutter/material.dart';

/// Represent money card for account screen.
class MoneyCard extends StatelessWidget {
  const MoneyCard({
    Key? key,
    required this.money,
    this.isEnableCard = true,
    this.onTap,
    this.onTapMyQuery,
    this.onTapCondition,
  }) : super(key: key);

  /// Button click event handler.
  final VoidCallback? onTap;

  /// A value of the money with currency.
  final String money;

  /// A flag responsible for enabling button.
  final bool isEnableCard;

  /// My query
  final VoidCallback? onTapMyQuery;

  /// My query
  final VoidCallback? onTapCondition;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FittedBox(
                child: Text(
                  money,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              AstraBorderedButton(
                title: AccountTexts.withdraw,
                isEnableButton: isEnableCard,
                onTap: onTap,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: onTapCondition,
                child: Text(
                  AccountTexts.withdrawalConditions,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AstraColors.black08,
                      ),
                ),
              ),
              TextButton(
                onPressed: onTapMyQuery,
                child: Text(
                  AccountTexts.myRequests,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AstraColors.black08,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
