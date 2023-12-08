import 'package:flutter/material.dart';

import '../../helper/intl_helper.dart';
import '../../helper/size_helper.dart';

class ListHistoryWidget extends StatelessWidget {
  const ListHistoryWidget({
    super.key,
    required this.name,
    required this.date,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String name;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        width: SizeHelper.width(context) * 90 / 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Divider(),
            Align(
              child: Text(IntlHelper.convertDateTime(date)),
              alignment: Alignment.centerRight,
            )
          ],
        ),
      ),
    );
  }
}
