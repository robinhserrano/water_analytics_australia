// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_landing_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CloudLandingPrice _$CloudLandingPriceFromJson(Map<String, dynamic> json) {
  return _CloudLandingPrice.fromJson(json);
}

/// @nodoc
mixin _$CloudLandingPrice {
  double get installationService => throw _privateConstructorUsedError;
  String get internalReference => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get productCategory => throw _privateConstructorUsedError;
  double get supplyOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudLandingPriceCopyWith<CloudLandingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudLandingPriceCopyWith<$Res> {
  factory $CloudLandingPriceCopyWith(
          CloudLandingPrice value, $Res Function(CloudLandingPrice) then) =
      _$CloudLandingPriceCopyWithImpl<$Res, CloudLandingPrice>;
  @useResult
  $Res call(
      {double installationService,
      String internalReference,
      String name,
      String productCategory,
      double supplyOnly});
}

/// @nodoc
class _$CloudLandingPriceCopyWithImpl<$Res, $Val extends CloudLandingPrice>
    implements $CloudLandingPriceCopyWith<$Res> {
  _$CloudLandingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installationService = null,
    Object? internalReference = null,
    Object? name = null,
    Object? productCategory = null,
    Object? supplyOnly = null,
  }) {
    return _then(_value.copyWith(
      installationService: null == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double,
      internalReference: null == internalReference
          ? _value.internalReference
          : internalReference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productCategory: null == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String,
      supplyOnly: null == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudLandingPriceImplCopyWith<$Res>
    implements $CloudLandingPriceCopyWith<$Res> {
  factory _$$CloudLandingPriceImplCopyWith(_$CloudLandingPriceImpl value,
          $Res Function(_$CloudLandingPriceImpl) then) =
      __$$CloudLandingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double installationService,
      String internalReference,
      String name,
      String productCategory,
      double supplyOnly});
}

/// @nodoc
class __$$CloudLandingPriceImplCopyWithImpl<$Res>
    extends _$CloudLandingPriceCopyWithImpl<$Res, _$CloudLandingPriceImpl>
    implements _$$CloudLandingPriceImplCopyWith<$Res> {
  __$$CloudLandingPriceImplCopyWithImpl(_$CloudLandingPriceImpl _value,
      $Res Function(_$CloudLandingPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installationService = null,
    Object? internalReference = null,
    Object? name = null,
    Object? productCategory = null,
    Object? supplyOnly = null,
  }) {
    return _then(_$CloudLandingPriceImpl(
      installationService: null == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double,
      internalReference: null == internalReference
          ? _value.internalReference
          : internalReference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productCategory: null == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String,
      supplyOnly: null == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudLandingPriceImpl implements _CloudLandingPrice {
  const _$CloudLandingPriceImpl(
      {required this.installationService,
      required this.internalReference,
      required this.name,
      required this.productCategory,
      required this.supplyOnly});

  factory _$CloudLandingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudLandingPriceImplFromJson(json);

  @override
  final double installationService;
  @override
  final String internalReference;
  @override
  final String name;
  @override
  final String productCategory;
  @override
  final double supplyOnly;

  @override
  String toString() {
    return 'CloudLandingPrice(installationService: $installationService, internalReference: $internalReference, name: $name, productCategory: $productCategory, supplyOnly: $supplyOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudLandingPriceImpl &&
            (identical(other.installationService, installationService) ||
                other.installationService == installationService) &&
            (identical(other.internalReference, internalReference) ||
                other.internalReference == internalReference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            (identical(other.supplyOnly, supplyOnly) ||
                other.supplyOnly == supplyOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, installationService,
      internalReference, name, productCategory, supplyOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudLandingPriceImplCopyWith<_$CloudLandingPriceImpl> get copyWith =>
      __$$CloudLandingPriceImplCopyWithImpl<_$CloudLandingPriceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudLandingPriceImplToJson(
      this,
    );
  }
}

abstract class _CloudLandingPrice implements CloudLandingPrice {
  const factory _CloudLandingPrice(
      {required final double installationService,
      required final String internalReference,
      required final String name,
      required final String productCategory,
      required final double supplyOnly}) = _$CloudLandingPriceImpl;

  factory _CloudLandingPrice.fromJson(Map<String, dynamic> json) =
      _$CloudLandingPriceImpl.fromJson;

  @override
  double get installationService;
  @override
  String get internalReference;
  @override
  String get name;
  @override
  String get productCategory;
  @override
  double get supplyOnly;
  @override
  @JsonKey(ignore: true)
  _$$CloudLandingPriceImplCopyWith<_$CloudLandingPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
