import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creates activity indicator that spins clockwise, depending on the platforms, a) An iOS-style in IOS. b) Material style in android.
class PlatformActivityIndicator extends StatelessWidget {
  /// Whether the activity indicator brightness is dark or light.
  ///
  /// /// Defaults to false.
  final bool isCapertinoDarkTheme;

  /// Color of the activity indicator.
  ///
  /// Defaults to color extracted from native.
  final Color? materialIndicatorColor;
  const PlatformActivityIndicator(
      {Key? key,
      this.isCapertinoDarkTheme = false,
      this.materialIndicatorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ios = Platform.isIOS || Platform.isMacOS;
    return ios
        ? CupertinoTheme(
            data: CupertinoTheme.of(context).copyWith(
              brightness:
                  isCapertinoDarkTheme ? Brightness.dark : Brightness.light,
            ),
            child: const CupertinoActivityIndicator(),
          )
        : Center(
            child: CircularProgressIndicator(color: materialIndicatorColor),
          );
  }
}
