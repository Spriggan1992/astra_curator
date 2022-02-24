import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/buttons/astra_borderred_button.dart';
import 'package:flutter/material.dart';

/// Represent money card for account screen.
class MoneyCard extends StatelessWidget {
  const MoneyCard({
    Key? key,
    required this.money,
    this.isEnableCard = true,
    this.onTap,
  }) : super(key: key);
  
    /// Button click event handler.
  final VoidCallback? onTap;
   /// A value of the money with currency.
  final String money;
   /// A flag responsible for enabling button.
  final bool isEnableCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  money,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                AstraBorderedButton(
                  title: 'Вывести',
                  isEnableButton: isEnableCard,
                  onTap:onTap,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Условия выведения',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AstraColors.black08,
              ),
            )
          ],
        ),
      ),
    );
  }
}
