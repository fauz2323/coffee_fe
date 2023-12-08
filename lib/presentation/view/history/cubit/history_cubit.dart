import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/data/model/history_model.dart';
import 'package:kopi_tester_fe/domain/controller/checker_controller.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState.initial());
  late HistoryModel _historyModel;
  final CheckerController _checkerController = CheckerController();
  var token;
  final TokenHelper _tokenHelper = TokenHelper();

  initial() async {
    emit(HistoryState.loading());
    token = await _tokenHelper.getToken();
    var request = await _checkerController.getHistory(token);
    if (request.statusCode == 200) {
      _historyModel = HistoryModel.fromJson(request.data);
      emit(HistoryState.loaded(_historyModel));
    } else if (request.statusCode == 401) {
      emit(HistoryState.unauthorized());
    } else {
      emit(HistoryState.error(request.message));
    }
  }
}
