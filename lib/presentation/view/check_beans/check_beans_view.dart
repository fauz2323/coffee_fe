import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/data/freezed_model/upload_freezed.dart';
import 'package:kopi_tester_fe/helper/size_helper.dart';
import 'package:kopi_tester_fe/presentation/view/check_beans/cubit/check_beans_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/button_widget.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';
import 'package:kopi_tester_fe/theme/color_theme.dart';
import 'package:kopi_tester_fe/theme/text_theme.dart';

import '../../../helper/token_helper.dart';

class CheckBeansView extends StatelessWidget {
  const CheckBeansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckBeansCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Beans'),
      ),
      body: BlocConsumer<CheckBeansCubit, CheckBeansState>(
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
            error: (message) => ErrorWidget(message),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, UploadFreezed data) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data.isUpload
                ? Center(
                    child: Image.file(data.image!),
                  )
                : GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext incontext) {
                          return BlocProvider.value(
                            value: context.read<CheckBeansCubit>(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ButtonWidget(
                                      onTap: () {
                                        Navigator.pop(incontext);
                                        context
                                            .read<CheckBeansCubit>()
                                            .openCam('camera');
                                      },
                                      tittle: "Open Camera",
                                      width:
                                          SizeHelper.width(context) * 90 / 100,
                                      height: 42,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ButtonWidget(
                                      onTap: () {
                                        Navigator.pop(incontext);
                                        context
                                            .read<CheckBeansCubit>()
                                            .openCam('gallery');
                                      },
                                      tittle: "Open Gallery",
                                      width:
                                          SizeHelper.width(context) * 90 / 100,
                                      height: 42,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: SizeHelper.width(context) * 0.9,
                      height: SizeHelper.height(context) * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorsTheme.primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera,
                          size: 100,
                          color: ColorsTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              onTap: () async {
                var message = await context
                    .read<CheckBeansCubit>()
                    .upload(data.selectedType);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              tittle: "Check Beans",
              width: SizeHelper.width(context) * 90 / 100,
              height: 42,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Result",
              style: TextsTheme.textBold,
            ),
            SizedBox(
              height: 5,
            ),
            Text('Tingkat Akurasi : 87.5%'),
            Text('Red : ' + data.red.toString()),
            Text('Green : ' + data.green.toString()),
            Text('Blue : ' + data.blue.toString()),
            Text('Result : ' + data.result.toString()),
          ],
        ),
      ),
    );
  }
}
