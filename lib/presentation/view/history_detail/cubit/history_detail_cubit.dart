import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/history_detail_model.dart';
import '../../../../domain/controller/checker_controller.dart';
import '../../../../helper/token_helper.dart';

part 'history_detail_state.dart';
part 'history_detail_cubit.freezed.dart';

class HistoryDetailCubit extends Cubit<HistoryDetailState> {
  HistoryDetailCubit() : super(HistoryDetailState.initial());
  final CheckerController _checkerController = CheckerController();
  var token;
  final TokenHelper _tokenHelper = TokenHelper();
  late DetailHistoryModel _detailHistoryModel;

  initial(String uuid) async {
    emit(HistoryDetailState.loading());
    token = await _tokenHelper.getToken();
    print(token);
    var request = await _checkerController.getDetailHistory(token, uuid);
    if (request.statusCode == 200) {
      _detailHistoryModel = DetailHistoryModel.fromJson(request.data);
      emit(HistoryDetailState.loaded(_detailHistoryModel));
    } else if (request.statusCode == 401) {
      emit(HistoryDetailState.unauthorized());
    } else {
      emit(HistoryDetailState.error(request.message));
    }
  }
}
