import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/data/model/auth_model.dart';
import 'package:kopi_tester_fe/helper/intl_helper.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/presentation/view/profile/cubit/profile_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';
import 'package:kopi_tester_fe/theme/color_theme.dart';

import '../../../helper/token_helper.dart';
import '../../widget/menu_profile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
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
              error: (message) => ErrorWidget(message),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context, AuthModel data) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeHelper.height(context) * 5 / 100,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
              width: SizeHelper.width(context) * 90 / 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        width: SizeHelper.width(context) * 20 / 100,
                        color: ColorsTheme.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.user.name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(data.user.email),
                          Text(IntlHelper.convertDateTime(data.user.createdAt))
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () async {
                        var message =
                            await context.read<ProfileCubit>().logout();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: SizeHelper.width(context) * 25 / 100,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "LogOut",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            MenuProfileWidget(
              func: () {},
              tittle: "Tentang Aplikasi",
              icon: Icons.apps,
            ),
          ],
        ),
      ),
    );
  }
}
