import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_app_state.dart';
part 'about_app_cubit.freezed.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit() : super(AboutAppState.initial());
}
