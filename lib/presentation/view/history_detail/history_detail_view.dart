import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/presentation/view/history_detail/cubit/history_detail_cubit.dart';

import '../../../data/model/detail_argument.dart';
import '../../../data/model/history_detail_model.dart';
import '../../../helper/token_helper.dart';
import '../../widget/loading_widget.dart';

class HistoryDetailView extends StatelessWidget {
  const HistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as DetailArgument;

    return BlocProvider(
      create: (context) => HistoryDetailCubit()..initial(argument.uuid),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Detail'),
      ),
      body: BlocConsumer<HistoryDetailCubit, HistoryDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Placeholder(),
            loaded: (data) => _loaded(context, data),
            loading: () => LoadingWidget(),
            error: (message) => ErrorWidget(message),
          );
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unauthorized: () async {
              await TokenHelper().deleteAllToken();
              Navigator.pushReplacementNamed(context, 'login');
            },
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, DetailHistoryModel dat) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "http://10.0.2.2:8000/storage/images/" +
                  dat.history.image.image,
              placeholder: (context, url) => const LoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Image Name : ${dat.history.image.image}'),
            SizedBox(
              height: 10,
            ),
            Text('Result Beans : ${dat.history.type}'),
            SizedBox(
              height: 10,
            ),
            Text('Red : ${dat.history.red}'),
            SizedBox(
              height: 10,
            ),
            Text('Green : ${dat.history.green}'),
            SizedBox(
              height: 10,
            ),
            Text('Blue : ${dat.history.blue}'),
            SizedBox(
              height: 10,
            ),
            Text('Created At : ${dat.history.createdAt}'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
