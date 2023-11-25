import 'package:flutter/material.dart';

import '../../helper/size_helper.dart';
import '../../theme/color_theme.dart';

class MenuHomeWidget extends StatelessWidget {
  const MenuHomeWidget({
    super.key,
    required this.tittle,
    required this.icon,
    required this.onTap,
  });
  final String tittle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: SizeHelper.width(context) * 25 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsTheme.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 45,
              ),
            ),
            SizedBox(
              height: 35,
              child: Text(
                tittle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
