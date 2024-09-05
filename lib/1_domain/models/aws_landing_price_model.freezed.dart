// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aws_landing_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AwsLandingPrice _$AwsLandingPriceFromJson(Map<String, dynamic> json) {
  return _AwsLandingPrice.fromJson(json);
}

/// @nodoc
mixin _$AwsLandingPrice {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'internal_reference')
  String? get internalReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category')
  String? get productCategory => throw _privateConstructorUsedError;
  List<AwsLandingPriceHistory>? get history =>
      throw _privateConstructorUsedError;

  /// Serializes this AwsLandingPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AwsLandingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AwsLandingPriceCopyWith<AwsLandingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsLandingPriceCopyWith<$Res> {
  factory $AwsLandingPriceCopyWith(
          AwsLandingPrice value, $Res Function(AwsLandingPrice) then) =
      _$AwsLandingPriceCopyWithImpl<$Res, AwsLandingPrice>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'internal_reference') String? internalReference,
      @JsonKey(name: 'product_category') String? productCategory,
      List<AwsLandingPriceHistory>? history});
}

/// @nodoc
class _$AwsLandingPriceCopyWithImpl<$Res, $Val extends AwsLandingPrice>
    implements $AwsLandingPriceCopyWith<$Res> {
  _$AwsLandingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AwsLandingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? internalReference = freezed,
    Object? productCategory = freezed,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AwsLandingPriceHistory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwsLandingPriceImplCopyWith<$Res>
    implements $AwsLandingPriceCopyWith<$Res> {
  factory _$$AwsLandingPriceImplCopyWith(_$AwsLandingPriceImpl value,
          $Res Function(_$AwsLandingPriceImpl) then) =
      __$$AwsLandingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'internal_reference') String? internalReference,
      @JsonKey(name: 'product_category') String? productCategory,
      List<AwsLandingPriceHistory>? history});
}

/// @nodoc
class __$$AwsLandingPriceImplCopyWithImpl<$Res>
    extends _$AwsLandingPriceCopyWithImpl<$Res, _$AwsLandingPriceImpl>
    implements _$$AwsLandingPriceImplCopyWith<$Res> {
  __$$AwsLandingPriceImplCopyWithImpl(
      _$AwsLandingPriceImpl _value, $Res Function(_$AwsLandingPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AwsLandingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? internalReference = freezed,
    Object? productCategory = freezed,
    Object? history = freezed,
  }) {
    return _then(_$AwsLandingPriceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      history: freezed == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AwsLandingPriceHistory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsLandingPriceImpl implements _AwsLandingPrice {
  const _$AwsLandingPriceImpl(
      {required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'internal_reference') required this.internalReference,
      @JsonKey(name: 'product_category') required this.productCategory,
      required final List<AwsLandingPriceHistory>? history})
      : _history = history;

  factory _$AwsLandingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsLandingPriceImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'internal_reference')
  final String? internalReference;
  @override
  @JsonKey(name: 'product_category')
  final String? productCategory;
  final List<AwsLandingPriceHistory>? _history;
  @override
  List<AwsLandingPriceHistory>? get history {
    final value = _history;
    if (value == null) return null;
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AwsLandingPrice(id: $id, name: $name, internalReference: $internalReference, productCategory: $productCategory, history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsLandingPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.internalReference, internalReference) ||
                other.internalReference == internalReference) &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, internalReference,
      productCategory, const DeepCollectionEquality().hash(_history));

  /// Create a copy of AwsLandingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsLandingPriceImplCopyWith<_$AwsLandingPriceImpl> get copyWith =>
      __$$AwsLandingPriceImplCopyWithImpl<_$AwsLandingPriceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsLandingPriceImplToJson(
      this,
    );
  }
}

abstract class _AwsLandingPrice implements AwsLandingPrice {
  const factory _AwsLandingPrice(
      {required final int id,
      @JsonKey(name: 'name') required final String? name,
      @JsonKey(name: 'internal_reference')
      required final String? internalReference,
      @JsonKey(name: 'product_category') required final String? productCategory,
      required final List<AwsLandingPriceHistory>?
          history}) = _$AwsLandingPriceImpl;

  factory _AwsLandingPrice.fromJson(Map<String, dynamic> json) =
      _$AwsLandingPriceImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'internal_reference')
  String? get internalReference;
  @override
  @JsonKey(name: 'product_category')
  String? get productCategory;
  @override
  List<AwsLandingPriceHistory>? get history;

  /// Create a copy of AwsLandingPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AwsLandingPriceImplCopyWith<_$AwsLandingPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AwsLandingPriceHistory _$AwsLandingPriceHistoryFromJson(
    Map<String, dynamic> json) {
  return _AwsLandingPriceHistory.fromJson(json);
}

/// @nodoc
mixin _$AwsLandingPriceHistory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'installation_service')
  double? get installationService => throw _privateConstructorUsedError;
  @JsonKey(name: 'supply_only')
  double? get supplyOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this AwsLandingPriceHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AwsLandingPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AwsLandingPriceHistoryCopyWith<AwsLandingPriceHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsLandingPriceHistoryCopyWith<$Res> {
  factory $AwsLandingPriceHistoryCopyWith(AwsLandingPriceHistory value,
          $Res Function(AwsLandingPriceHistory) then) =
      _$AwsLandingPriceHistoryCopyWithImpl<$Res, AwsLandingPriceHistory>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'installation_service') double? installationService,
      @JsonKey(name: 'supply_only') double? supplyOnly,
      @JsonKey(name: 'recorded_at') DateTime? recordedAt});
}

/// @nodoc
class _$AwsLandingPriceHistoryCopyWithImpl<$Res,
        $Val extends AwsLandingPriceHistory>
    implements $AwsLandingPriceHistoryCopyWith<$Res> {
  _$AwsLandingPriceHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AwsLandingPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? installationService = freezed,
    Object? supplyOnly = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      installationService: freezed == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyOnly: freezed == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwsLandingPriceHistoryImplCopyWith<$Res>
    implements $AwsLandingPriceHistoryCopyWith<$Res> {
  factory _$$AwsLandingPriceHistoryImplCopyWith(
          _$AwsLandingPriceHistoryImpl value,
          $Res Function(_$AwsLandingPriceHistoryImpl) then) =
      __$$AwsLandingPriceHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'installation_service') double? installationService,
      @JsonKey(name: 'supply_only') double? supplyOnly,
      @JsonKey(name: 'recorded_at') DateTime? recordedAt});
}

/// @nodoc
class __$$AwsLandingPriceHistoryImplCopyWithImpl<$Res>
    extends _$AwsLandingPriceHistoryCopyWithImpl<$Res,
        _$AwsLandingPriceHistoryImpl>
    implements _$$AwsLandingPriceHistoryImplCopyWith<$Res> {
  __$$AwsLandingPriceHistoryImplCopyWithImpl(
      _$AwsLandingPriceHistoryImpl _value,
      $Res Function(_$AwsLandingPriceHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AwsLandingPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? installationService = freezed,
    Object? supplyOnly = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(_$AwsLandingPriceHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      installationService: freezed == installationService
          ? _value.installationService
          : installationService // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyOnly: freezed == supplyOnly
          ? _value.supplyOnly
          : supplyOnly // ignore: cast_nullable_to_non_nullable
              as double?,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsLandingPriceHistoryImpl implements _AwsLandingPriceHistory {
  const _$AwsLandingPriceHistoryImpl(
      {required this.id,
      @JsonKey(name: 'installation_service') required this.installationService,
      @JsonKey(name: 'supply_only') required this.supplyOnly,
      @JsonKey(name: 'recorded_at') required this.recordedAt});

  factory _$AwsLandingPriceHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsLandingPriceHistoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'installation_service')
  final double? installationService;
  @override
  @JsonKey(name: 'supply_only')
  final double? supplyOnly;
  @override
  @JsonKey(name: 'recorded_at')
  final DateTime? recordedAt;

  @override
  String toString() {
    return 'AwsLandingPriceHistory(id: $id, installationService: $installationService, supplyOnly: $supplyOnly, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsLandingPriceHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.installationService, installationService) ||
                other.installationService == installationService) &&
            (identical(other.supplyOnly, supplyOnly) ||
                other.supplyOnly == supplyOnly) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, installationService, supplyOnly, recordedAt);

  /// Create a copy of AwsLandingPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsLandingPriceHistoryImplCopyWith<_$AwsLandingPriceHistoryImpl>
      get copyWith => __$$AwsLandingPriceHistoryImplCopyWithImpl<
          _$AwsLandingPriceHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsLandingPriceHistoryImplToJson(
      this,
    );
  }
}

abstract class _AwsLandingPriceHistory implements AwsLandingPriceHistory {
  const factory _AwsLandingPriceHistory(
          {required final int id,
          @JsonKey(name: 'installation_service')
          required final double? installationService,
          @JsonKey(name: 'supply_only') required final double? supplyOnly,
          @JsonKey(name: 'recorded_at') required final DateTime? recordedAt}) =
      _$AwsLandingPriceHistoryImpl;

  factory _AwsLandingPriceHistory.fromJson(Map<String, dynamic> json) =
      _$AwsLandingPriceHistoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'installation_service')
  double? get installationService;
  @override
  @JsonKey(name: 'supply_only')
  double? get supplyOnly;
  @override
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt;

  /// Create a copy of AwsLandingPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AwsLandingPriceHistoryImplCopyWith<_$AwsLandingPriceHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
