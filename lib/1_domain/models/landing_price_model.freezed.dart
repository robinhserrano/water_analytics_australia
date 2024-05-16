// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LandingPrice _$LandingPriceFromJson(Map<String, dynamic> json) {
  return _LandingPrice.fromJson(json);
}

/// @nodoc
mixin _$LandingPrice {
  String? get name => throw _privateConstructorUsedError;
  String? get internalReference => throw _privateConstructorUsedError;
  String? get productCategory => throw _privateConstructorUsedError;
  double? get installationService => throw _privateConstructorUsedError;
  double? get supplyOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LandingPriceCopyWith<LandingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingPriceCopyWith<$Res> {
  factory $LandingPriceCopyWith(
          LandingPrice value, $Res Function(LandingPrice) then) =
      _$LandingPriceCopyWithImpl<$Res, LandingPrice>;
  @useResult
  $Res call(
      {String? name,
      String? internalReference,
      String? productCategory,
      double? installationService,
      double? supplyOnly});
}

/// @nodoc
class _$LandingPriceCopyWithImpl<$Res, $Val extends LandingPrice>
    implements $LandingPriceCopyWith<$Res> {
  _$LandingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? internalReference = freezed,
    Object? productCategory = freezed,
    Object? installationService = freezed,
    Object? supplyOnly = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      internalReference: freezed == internalReference
          ? _value.internalReference
          : internalReference // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      installationService: freezed == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyOnly: freezed == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LandingPriceImplCopyWith<$Res>
    implements $LandingPriceCopyWith<$Res> {
  factory _$$LandingPriceImplCopyWith(
          _$LandingPriceImpl value, $Res Function(_$LandingPriceImpl) then) =
      __$$LandingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? internalReference,
      String? productCategory,
      double? installationService,
      double? supplyOnly});
}

/// @nodoc
class __$$LandingPriceImplCopyWithImpl<$Res>
    extends _$LandingPriceCopyWithImpl<$Res, _$LandingPriceImpl>
    implements _$$LandingPriceImplCopyWith<$Res> {
  __$$LandingPriceImplCopyWithImpl(
      _$LandingPriceImpl _value, $Res Function(_$LandingPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? internalReference = freezed,
    Object? productCategory = freezed,
    Object? installationService = freezed,
    Object? supplyOnly = freezed,
  }) {
    return _then(_$LandingPriceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      internalReference: freezed == internalReference
          ? _value.internalReference
          : internalReference // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      installationService: freezed == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyOnly: freezed == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LandingPriceImpl implements _LandingPrice {
  const _$LandingPriceImpl(
      {required this.name,
      required this.internalReference,
      required this.productCategory,
      required this.installationService,
      required this.supplyOnly});

  factory _$LandingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LandingPriceImplFromJson(json);

  @override
  final String? name;
  @override
  final String? internalReference;
  @override
  final String? productCategory;
  @override
  final double? installationService;
  @override
  final double? supplyOnly;

  @override
  String toString() {
    return 'LandingPrice(name: $name, internalReference: $internalReference, productCategory: $productCategory, installationService: $installationService, supplyOnly: $supplyOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandingPriceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.internalReference, internalReference) ||
                other.internalReference == internalReference) &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            (identical(other.installationService, installationService) ||
                other.installationService == installationService) &&
            (identical(other.supplyOnly, supplyOnly) ||
                other.supplyOnly == supplyOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, internalReference,
      productCategory, installationService, supplyOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LandingPriceImplCopyWith<_$LandingPriceImpl> get copyWith =>
      __$$LandingPriceImplCopyWithImpl<_$LandingPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LandingPriceImplToJson(
      this,
    );
  }
}

abstract class _LandingPrice implements LandingPrice {
  const factory _LandingPrice(
      {required final String? name,
      required final String? internalReference,
      required final String? productCategory,
      required final double? installationService,
      required final double? supplyOnly}) = _$LandingPriceImpl;

  factory _LandingPrice.fromJson(Map<String, dynamic> json) =
      _$LandingPriceImpl.fromJson;

  @override
  String? get name;
  @override
  String? get internalReference;
  @override
  String? get productCategory;
  @override
  double? get installationService;
  @override
  double? get supplyOnly;
  @override
  @JsonKey(ignore: true)
  _$$LandingPriceImplCopyWith<_$LandingPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
