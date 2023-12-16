import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/presentation/view/login/cubit/login_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';

import '../../../helper/size_helper.dart';
import '../../../theme/text_theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_button_widget.dart';
import '../../widget/text_form_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: () {
                Navigator.pushReplacementNamed(context, 'home');
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => _initial(context),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizeHelper.height(context) * 30 / 100,
                  width: SizeHelper.width(context) * 90 / 100,
                  child: Center(child: Text("LOGO")),
                ),
                Text(
                  'Log In Now',
                  style: TextsTheme.textBold,
                ),
                Text(
                  "login untuk melanjutkan proses masuk aplikasi",
                  style: TextsTheme.textecondary,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormWidget(
                  controller: usernameController,
                  obsecureText: false,
                  tittle: "Username",
                ),
                TextFormWidget(
                  controller: passwordController,
                  obsecureText: true,
                  tittle: "Password",
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    )),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  onTap: () async {
                    var message = await context.read<LoginCubit>().login(
                        usernameController.text, passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  tittle: "Login",
                  width: SizeHelper.width(context) * 90 / 100,
                  height: SizeHelper.height(context) * 8 / 100,
                ),
                TextButtonWidget(
                    text: "Tidak punya akun?",
                    tittle: "register",
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'register',
                        ModalRoute.withName("get-started"),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
