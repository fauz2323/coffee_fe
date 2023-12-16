import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/data/model/auth_model.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';
import 'package:kopi_tester_fe/presentation/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';
import 'package:kopi_tester_fe/theme/color_theme.dart';

import '../../widget/menu_home_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..initial(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorized: () async {
              await TokenHelper().deleteAllToken();
              Navigator.pushReplacementNamed(context, 'login');
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loaded: (data) => _loaded(context, data),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, AuthModel data) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, User Test",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: SizeHelper.width(context) * 90 / 100,
                height: SizeHelper.height(context) * 20 / 100,
                decoration: BoxDecoration(
                  color: ColorsTheme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Selamat datang di aplikasi identify coffee beans dengan tingkat akurasi 87,5%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Menu",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuHomeWidget(
                    tittle: "Check Beans",
                    icon: Icons.image,
                    onTap: () {
                      Navigator.pushNamed(context, 'check-beans');
                    },
                  ),
                  MenuHomeWidget(
                    tittle: "History",
                    icon: Icons.history,
                    onTap: () {
                      Navigator.pushNamed(context, 'history');
                    },
                  ),
                  MenuHomeWidget(
                    tittle: "About Apps",
                    icon: Icons.apps,
                    onTap: () {
                      Navigator.pushNamed(context, 'detail-app');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
