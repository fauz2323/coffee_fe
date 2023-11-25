import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/presentation/view/register/cubit/register_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/button_widget.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';
import 'package:kopi_tester_fe/presentation/widget/text_button_widget.dart';
import 'package:kopi_tester_fe/theme/text_theme.dart';

import '../../../helper/size_helper.dart';
import '../../widget/text_form_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameControlle = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameControlle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
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
                  height: SizeHelper.height(context) * 15 / 100,
                  width: SizeHelper.width(context) * 90 / 100,
                  child: Center(child: Text("LOGO")),
                ),
                Text(
                  'Sign Up Now',
                  style: TextsTheme.textBold,
                ),
                Text(
                  "Please fill form and create the account",
                  style: TextsTheme.textecondary,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormWidget(
                  controller: nameController,
                  obsecureText: false,
                  tittle: "Full Name",
                ),
                TextFormWidget(
                  controller: emailController,
                  obsecureText: false,
                  tittle: "Email",
                ),
                TextFormWidget(
                  controller: usernameControlle,
                  obsecureText: false,
                  tittle: "Username",
                ),
                TextFormWidget(
                  controller: passwordController,
                  obsecureText: true,
                  tittle: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  onTap: () async {
                    var message = await context.read<RegisterCubit>().register(
                        nameController.text,
                        emailController.text,
                        usernameControlle.text,
                        passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  tittle: "Register",
                  width: SizeHelper.width(context) * 90 / 100,
                  height: SizeHelper.height(context) * 8 / 100,
                ),
                TextButtonWidget(
                    text: "Already have an account?",
                    tittle: "Sign In",
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'login',
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
