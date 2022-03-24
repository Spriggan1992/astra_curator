import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/base_error_screen.dart';
import 'package:flutter/material.dart';

class EmptyDataScreen extends BaseErrorScreen {
  final String title;
  final VoidCallback? onClick;
  EmptyDataScreen({
    Key? key,
    this.title = 'Список пуст',
    this.onClick,
  }) : super(
          key,
          title,
          onClick == null
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: onClick,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Найти пару',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        );
}
