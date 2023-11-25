import 'package:flutter/material.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/theme/text_theme.dart';

import '../../widget/button_widget.dart';
import '../../widget/text_button_widget.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("LOGO"),
                ),
                SizedBox(
                  height: SizeHelper.height(context) * 20 / 100,
                ),
                SizedBox(
                  height: SizeHelper.height(context) * 30 / 100,
                  width: SizeHelper.width(context) * 90 / 100,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "WELCOME",
                  style: TextsTheme.textBold,
                ),
                Text(
                  "Create an account and access thousand of cool features",
                  textAlign: TextAlign.center,
                  style: TextsTheme.textecondary,
                ),
                SizedBox(
                  height: SizeHelper.height(context) * 10 / 100,
                ),
                ButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  tittle: "Getting Started",
                  width: SizeHelper.width(context) * 90 / 100,
                  height: SizeHelper.height(context) * 8 / 100,
                ),
                TextButtonWidget(
                  text: "Already have an account?",
                  tittle: "Sign In",
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
