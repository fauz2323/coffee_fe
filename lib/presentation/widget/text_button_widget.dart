import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.tittle,
    required this.onTap,
  });
  final String text;
  final String tittle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              tittle,
              style: TextStyle(color: ColorsTheme.primaryColor),
            ))
      ],
    );
  }
}
