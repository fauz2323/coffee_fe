import 'package:flutter/material.dart';
import 'package:kopi_tester_fe/theme/text_theme.dart';

import '../../../helper/size_helper.dart';
import '../../../theme/color_theme.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: SizeHelper.width(context) * 90 / 100,
              height: SizeHelper.height(context) * 20 / 100,
              decoration: BoxDecoration(
                color: ColorsTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "Aplikasi identify coffee beans dengan tingkat akurasi 87,5%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "By Adi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Adirandhani.github.io",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "About App",
              style: TextsTheme.textBold,
            ),
            Divider(),
            Text('Version - 1.0.0'),
            Text('Developed by - Adi'),
            Text("Release - Desember 2023"),
            Divider(),
            Container(
              padding: EdgeInsets.all(20),
              width: SizeHelper.width(context) * 90 / 100,
              height: SizeHelper.height(context) * 20 / 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsTheme.primaryColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Copyright © 2023",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "This apps only for identify coffee beans, made with adi randhani in Jakarta, Indonesia",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
