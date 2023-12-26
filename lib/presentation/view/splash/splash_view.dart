import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/presentation/view/splash/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeWhen(
            orElse: () {},
            loaded: (route) async {
              if (route == 'home') {
                Navigator.pushReplacementNamed(context, 'home');
              } else {
                Navigator.pushReplacementNamed(context, 'get-started');
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => Container(
              child: Column(
                children: [
                  Spacer(),
                  Center(
                      child: Image.asset(
                    'assets/images/logo.png',
                    width: SizeHelper.width(context) * 50 / 100,
                  )),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
