import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopi_tester_fe/data/model/detail_argument.dart';
import 'package:kopi_tester_fe/data/model/history_model.dart';
import 'package:kopi_tester_fe/presentation/view/history/cubit/history_cubit.dart';
import 'package:kopi_tester_fe/presentation/widget/loading_widget.dart';

import '../../../helper/token_helper.dart';
import '../../widget/list_history_widget.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..initial(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocConsumer<HistoryCubit, HistoryState>(
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

  Widget _loaded(BuildContext context, HistoryModel data) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: data.listHistory
              .map(
                (e) => ListHistoryWidget(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'history-detail',
                      arguments: DetailArgument(uuid: e.uuid),
                    );
                  },
                  name: e.name,
                  date: e.createdAt,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
