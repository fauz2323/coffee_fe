import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopi_tester_fe/data/api/base_response_model.dart';
import 'package:kopi_tester_fe/data/freezed_model/upload_freezed.dart';
import 'package:kopi_tester_fe/data/model/upload_model.dart';
import 'package:kopi_tester_fe/helper/base_response_helper.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';
import 'package:http/http.dart' as http;

import '../../../../data/api/api.dart';

part 'check_beans_state.dart';
part 'check_beans_cubit.freezed.dart';

class CheckBeansCubit extends Cubit<CheckBeansState> {
  CheckBeansCubit() : super(CheckBeansState.initial());

  XFile? imagePath;
  final ImagePicker imagePicker = ImagePicker();
  final TokenHelper _tokenService = TokenHelper();
  File? image;
  var token;
  late UploadFreezed _uploadFreezed;
  late UploadModel _uploadModel;

  initial() async {
    emit(CheckBeansState.loading());
    _uploadFreezed = UploadFreezed(isUpload: false, selectedType: 'mentah');
    token = await _tokenService.getToken();
    emit(CheckBeansState.loaded(_uploadFreezed));
  }

  selectType(String type) {
    _uploadFreezed = _uploadFreezed.copyWith(selectedType: type);
    emit(CheckBeansState.loaded(_uploadFreezed));
  }

  openCam(String type) async {
    if (type == 'camera') {
      imagePath = (await imagePicker.pickImage(source: ImageSource.camera))!;
    } else {
      imagePath = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    }
    image = File(imagePath!.path);
    _uploadFreezed = _uploadFreezed.copyWith(isUpload: true, image: image);
    emit(CheckBeansState.loaded(_uploadFreezed));
  }

  upload(String type) async {
    emit(CheckBeansState.loading());
    var lengh = imagePath!.path;
    var request = http.MultipartRequest("POST", ApiEndpoint.UPLOAD);
    request.fields['type'] = type;
    request.files.add(
      await http.MultipartFile.fromPath("image", lengh),
    );
    request.headers.addAll(ApiEndpoint.getHeaderPost(token));
    var ress = await request.send();

    var ressStream = await http.Response.fromStream(ress);
    BaseResponseModel response = BaseResponseHelper.response(ressStream);

    if (response.statusCode == 200) {
      _uploadModel = UploadModel.fromJson(jsonDecode(ressStream.body));
      _uploadFreezed = _uploadFreezed.copyWith(
        isUpload: true,
        red: _uploadModel.red.toString(),
        green: _uploadModel.green.toString(),
        blue: _uploadModel.blue.toString(),
        result: _uploadModel.dataType.toString(),
      );
      emit(CheckBeansState.loaded(_uploadFreezed));
      return response.message;
    } else {
      emit(CheckBeansState.loaded(_uploadFreezed));
      return response.message;
    }
  }
}
