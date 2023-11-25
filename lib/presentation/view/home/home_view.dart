import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/theme/color_theme.dart';

import '../home_screen/home_screen_view.dart';
import '../profile/profile_view.dart';
import 'cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _widgetOptionsUser = <Widget>[
    HomeScreenView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Placeholder(),
              error: (message) => Container(),
              initial: (index) => _widgetOptionsUser.elementAt(index),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Text("Some Error"),
            initial: (index) => NavigationBar(
              height: SizeHelper.height(context) * 0.07,
              backgroundColor: ColorsTheme.secondaryColor,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    selectedIcon: Icon(
                      Icons.home,
                      color: ColorsTheme.primaryColor,
                    )),
                NavigationDestination(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: 'Profile',
                    selectedIcon: Icon(
                      Icons.person,
                      color: ColorsTheme.primaryColor,
                    )),
              ],
              selectedIndex: index,
              onDestinationSelected: (index) {
                context.read<HomeCubit>().changeIndexUser(index);
              },
            ),
          );
        },
      ),
    );
  }
}
