// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadFreezed {
  File? get image => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get red => throw _privateConstructorUsedError;
  String get green => throw _privateConstructorUsedError;
  String get blue => throw _privateConstructorUsedError;
  bool get isUpload => throw _privateConstructorUsedError;
  String get selectedType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadFreezedCopyWith<UploadFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFreezedCopyWith<$Res> {
  factory $UploadFreezedCopyWith(
          UploadFreezed value, $Res Function(UploadFreezed) then) =
      _$UploadFreezedCopyWithImpl<$Res, UploadFreezed>;
  @useResult
  $Res call(
      {File? image,
      String result,
      String red,
      String green,
      String blue,
      bool isUpload,
      String selectedType});
}

/// @nodoc
class _$UploadFreezedCopyWithImpl<$Res, $Val extends UploadFreezed>
    implements $UploadFreezedCopyWith<$Res> {
  _$UploadFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? result = null,
    Object? red = null,
    Object? green = null,
    Object? blue = null,
    Object? isUpload = null,
    Object? selectedType = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as String,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as String,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as String,
      isUpload: null == isUpload
          ? _value.isUpload
          : isUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedType: null == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFreezedImplCopyWith<$Res>
    implements $UploadFreezedCopyWith<$Res> {
  factory _$$UploadFreezedImplCopyWith(
          _$UploadFreezedImpl value, $Res Function(_$UploadFreezedImpl) then) =
      __$$UploadFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File? image,
      String result,
      String red,
      String green,
      String blue,
      bool isUpload,
      String selectedType});
}

/// @nodoc
class __$$UploadFreezedImplCopyWithImpl<$Res>
    extends _$UploadFreezedCopyWithImpl<$Res, _$UploadFreezedImpl>
    implements _$$UploadFreezedImplCopyWith<$Res> {
  __$$UploadFreezedImplCopyWithImpl(
      _$UploadFreezedImpl _value, $Res Function(_$UploadFreezedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? result = null,
    Object? red = null,
    Object? green = null,
    Object? blue = null,
    Object? isUpload = null,
    Object? selectedType = null,
  }) {
    return _then(_$UploadFreezedImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as String,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as String,
      blue: null == blue
          ? _value.blue
          : blue // ignore: cast_nullable_to_non_nullable
              as String,
      isUpload: null == isUpload
          ? _value.isUpload
          : isUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedType: null == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadFreezedImpl
    with DiagnosticableTreeMixin
    implements _UploadFreezed {
  const _$UploadFreezedImpl(
      {this.image,
      this.result = 'upload Image First',
      this.red = '-',
      this.green = '-',
      this.blue = '-',
      required this.isUpload,
      required this.selectedType});

  @override
  final File? image;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String red;
  @override
  @JsonKey()
  final String green;
  @override
  @JsonKey()
  final String blue;
  @override
  final bool isUpload;
  @override
  final String selectedType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadFreezed(image: $image, result: $result, red: $red, green: $green, blue: $blue, isUpload: $isUpload, selectedType: $selectedType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadFreezed'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('red', red))
      ..add(DiagnosticsProperty('green', green))
      ..add(DiagnosticsProperty('blue', blue))
      ..add(DiagnosticsProperty('isUpload', isUpload))
      ..add(DiagnosticsProperty('selectedType', selectedType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFreezedImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.red, red) || other.red == red) &&
            (identical(other.green, green) || other.green == green) &&
            (identical(other.blue, blue) || other.blue == blue) &&
            (identical(other.isUpload, isUpload) ||
                other.isUpload == isUpload) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, image, result, red, green, blue, isUpload, selectedType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFreezedImplCopyWith<_$UploadFreezedImpl> get copyWith =>
      __$$UploadFreezedImplCopyWithImpl<_$UploadFreezedImpl>(this, _$identity);
}

abstract class _UploadFreezed implements UploadFreezed {
  const factory _UploadFreezed(
      {final File? image,
      final String result,
      final String red,
      final String green,
      final String blue,
      required final bool isUpload,
      required final String selectedType}) = _$UploadFreezedImpl;

  @override
  File? get image;
  @override
  String get result;
  @override
  String get red;
  @override
  String get green;
  @override
  String get blue;
  @override
  bool get isUpload;
  @override
  String get selectedType;
  @override
  @JsonKey(ignore: true)
  _$$UploadFreezedImplCopyWith<_$UploadFreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
