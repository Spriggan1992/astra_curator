
import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

class UserOnlineStatus extends StatelessWidget {
  /// A flag responsible whether the user online.
  final bool isOnline;

  /// A flag responsible whether the have internet connection.
  final bool hasInternet;

  const UserOnlineStatus({
    Key? key,
    required this.isOnline,
    required this.hasInternet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _setStatusTitle(),
      style: TextStyle(
        color: isOnline && hasInternet
            ? AstraColors.onlineStatus
            : AstraColors.grey,
        fontSize: 12,
      ),
    );
  }

  String _setStatusTitle() {
    if (!hasInternet) {
      return AppTexts.waitingNetwork;
    } else {
      return isOnline ? AppTexts.online : AppTexts.offline;
    }
  }
}
