// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aws_product_stocks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AwsProductStocks _$AwsProductStocksFromJson(Map<String, dynamic> json) {
  return _AwsProductStocks.fromJson(json);
}

/// @nodoc
mixin _$AwsProductStocks {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'categ_name')
  String? get categName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_cost')
  double? get avgCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_value')
  double? get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_available')
  double? get qtyAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_qty')
  double? get freeQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'incoming_qty')
  double? get incomingQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'outgoing_qty')
  double? get outgoingQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'virtual_available')
  double? get virtualAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse_id')
  int? get warehouseId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwsProductStocksCopyWith<AwsProductStocks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsProductStocksCopyWith<$Res> {
  factory $AwsProductStocksCopyWith(
          AwsProductStocks value, $Res Function(AwsProductStocks) then) =
      _$AwsProductStocksCopyWithImpl<$Res, AwsProductStocks>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'categ_name') String? categName,
      @JsonKey(name: 'avg_cost') double? avgCost,
      @JsonKey(name: 'total_value') double? totalValue,
      @JsonKey(name: 'qty_available') double? qtyAvailable,
      @JsonKey(name: 'free_qty') double? freeQty,
      @JsonKey(name: 'incoming_qty') double? incomingQty,
      @JsonKey(name: 'outgoing_qty') double? outgoingQty,
      @JsonKey(name: 'virtual_available') double? virtualAvailable,
      @JsonKey(name: 'warehouse_id') int? warehouseId});
}

/// @nodoc
class _$AwsProductStocksCopyWithImpl<$Res, $Val extends AwsProductStocks>
    implements $AwsProductStocksCopyWith<$Res> {
  _$AwsProductStocksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = freezed,
    Object? categName = freezed,
    Object? avgCost = freezed,
    Object? totalValue = freezed,
    Object? qtyAvailable = freezed,
    Object? freeQty = freezed,
    Object? incomingQty = freezed,
    Object? outgoingQty = freezed,
    Object? virtualAvailable = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      categName: freezed == categName
          ? _value.categName
          : categName // ignore: cast_nullable_to_non_nullable
              as String?,
      avgCost: freezed == avgCost
          ? _value.avgCost
          : avgCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyAvailable: freezed == qtyAvailable
          ? _value.qtyAvailable
          : qtyAvailable // ignore: cast_nullable_to_non_nullable
              as double?,
      freeQty: freezed == freeQty
          ? _value.freeQty
          : freeQty // ignore: cast_nullable_to_non_nullable
              as double?,
      incomingQty: freezed == incomingQty
          ? _value.incomingQty
          : incomingQty // ignore: cast_nullable_to_non_nullable
              as double?,
      outgoingQty: freezed == outgoingQty
          ? _value.outgoingQty
          : outgoingQty // ignore: cast_nullable_to_non_nullable
              as double?,
      virtualAvailable: freezed == virtualAvailable
          ? _value.virtualAvailable
          : virtualAvailable // ignore: cast_nullable_to_non_nullable
              as double?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwsProductStocksImplCopyWith<$Res>
    implements $AwsProductStocksCopyWith<$Res> {
  factory _$$AwsProductStocksImplCopyWith(_$AwsProductStocksImpl value,
          $Res Function(_$AwsProductStocksImpl) then) =
      __$$AwsProductStocksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'categ_name') String? categName,
      @JsonKey(name: 'avg_cost') double? avgCost,
      @JsonKey(name: 'total_value') double? totalValue,
      @JsonKey(name: 'qty_available') double? qtyAvailable,
      @JsonKey(name: 'free_qty') double? freeQty,
      @JsonKey(name: 'incoming_qty') double? incomingQty,
      @JsonKey(name: 'outgoing_qty') double? outgoingQty,
      @JsonKey(name: 'virtual_available') double? virtualAvailable,
      @JsonKey(name: 'warehouse_id') int? warehouseId});
}

/// @nodoc
class __$$AwsProductStocksImplCopyWithImpl<$Res>
    extends _$AwsProductStocksCopyWithImpl<$Res, _$AwsProductStocksImpl>
    implements _$$AwsProductStocksImplCopyWith<$Res> {
  __$$AwsProductStocksImplCopyWithImpl(_$AwsProductStocksImpl _value,
      $Res Function(_$AwsProductStocksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = freezed,
    Object? categName = freezed,
    Object? avgCost = freezed,
    Object? totalValue = freezed,
    Object? qtyAvailable = freezed,
    Object? freeQty = freezed,
    Object? incomingQty = freezed,
    Object? outgoingQty = freezed,
    Object? virtualAvailable = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_$AwsProductStocksImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      categName: freezed == categName
          ? _value.categName
          : categName // ignore: cast_nullable_to_non_nullable
              as String?,
      avgCost: freezed == avgCost
          ? _value.avgCost
          : avgCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyAvailable: freezed == qtyAvailable
          ? _value.qtyAvailable
          : qtyAvailable // ignore: cast_nullable_to_non_nullable
              as double?,
      freeQty: freezed == freeQty
          ? _value.freeQty
          : freeQty // ignore: cast_nullable_to_non_nullable
              as double?,
      incomingQty: freezed == incomingQty
          ? _value.incomingQty
          : incomingQty // ignore: cast_nullable_to_non_nullable
              as double?,
      outgoingQty: freezed == outgoingQty
          ? _value.outgoingQty
          : outgoingQty // ignore: cast_nullable_to_non_nullable
              as double?,
      virtualAvailable: freezed == virtualAvailable
          ? _value.virtualAvailable
          : virtualAvailable // ignore: cast_nullable_to_non_nullable
              as double?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsProductStocksImpl implements _AwsProductStocks {
  const _$AwsProductStocksImpl(
      {required this.id,
      @JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'categ_name') required this.categName,
      @JsonKey(name: 'avg_cost') required this.avgCost,
      @JsonKey(name: 'total_value') required this.totalValue,
      @JsonKey(name: 'qty_available') required this.qtyAvailable,
      @JsonKey(name: 'free_qty') required this.freeQty,
      @JsonKey(name: 'incoming_qty') required this.incomingQty,
      @JsonKey(name: 'outgoing_qty') required this.outgoingQty,
      @JsonKey(name: 'virtual_available') required this.virtualAvailable,
      @JsonKey(name: 'warehouse_id') required this.warehouseId});

  factory _$AwsProductStocksImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsProductStocksImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @JsonKey(name: 'categ_name')
  final String? categName;
  @override
  @JsonKey(name: 'avg_cost')
  final double? avgCost;
  @override
  @JsonKey(name: 'total_value')
  final double? totalValue;
  @override
  @JsonKey(name: 'qty_available')
  final double? qtyAvailable;
  @override
  @JsonKey(name: 'free_qty')
  final double? freeQty;
  @override
  @JsonKey(name: 'incoming_qty')
  final double? incomingQty;
  @override
  @JsonKey(name: 'outgoing_qty')
  final double? outgoingQty;
  @override
  @JsonKey(name: 'virtual_available')
  final double? virtualAvailable;
  @override
  @JsonKey(name: 'warehouse_id')
  final int? warehouseId;

  @override
  String toString() {
    return 'AwsProductStocks(id: $id, displayName: $displayName, categName: $categName, avgCost: $avgCost, totalValue: $totalValue, qtyAvailable: $qtyAvailable, freeQty: $freeQty, incomingQty: $incomingQty, outgoingQty: $outgoingQty, virtualAvailable: $virtualAvailable, warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsProductStocksImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.categName, categName) ||
                other.categName == categName) &&
            (identical(other.avgCost, avgCost) || other.avgCost == avgCost) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.qtyAvailable, qtyAvailable) ||
                other.qtyAvailable == qtyAvailable) &&
            (identical(other.freeQty, freeQty) || other.freeQty == freeQty) &&
            (identical(other.incomingQty, incomingQty) ||
                other.incomingQty == incomingQty) &&
            (identical(other.outgoingQty, outgoingQty) ||
                other.outgoingQty == outgoingQty) &&
            (identical(other.virtualAvailable, virtualAvailable) ||
                other.virtualAvailable == virtualAvailable) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      categName,
      avgCost,
      totalValue,
      qtyAvailable,
      freeQty,
      incomingQty,
      outgoingQty,
      virtualAvailable,
      warehouseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsProductStocksImplCopyWith<_$AwsProductStocksImpl> get copyWith =>
      __$$AwsProductStocksImplCopyWithImpl<_$AwsProductStocksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsProductStocksImplToJson(
      this,
    );
  }
}

abstract class _AwsProductStocks implements AwsProductStocks {
  const factory _AwsProductStocks(
          {required final int id,
          @JsonKey(name: 'display_name') required final String? displayName,
          @JsonKey(name: 'categ_name') required final String? categName,
          @JsonKey(name: 'avg_cost') required final double? avgCost,
          @JsonKey(name: 'total_value') required final double? totalValue,
          @JsonKey(name: 'qty_available') required final double? qtyAvailable,
          @JsonKey(name: 'free_qty') required final double? freeQty,
          @JsonKey(name: 'incoming_qty') required final double? incomingQty,
          @JsonKey(name: 'outgoing_qty') required final double? outgoingQty,
          @JsonKey(name: 'virtual_available')
          required final double? virtualAvailable,
          @JsonKey(name: 'warehouse_id') required final int? warehouseId}) =
      _$AwsProductStocksImpl;

  factory _AwsProductStocks.fromJson(Map<String, dynamic> json) =
      _$AwsProductStocksImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(name: 'categ_name')
  String? get categName;
  @override
  @JsonKey(name: 'avg_cost')
  double? get avgCost;
  @override
  @JsonKey(name: 'total_value')
  double? get totalValue;
  @override
  @JsonKey(name: 'qty_available')
  double? get qtyAvailable;
  @override
  @JsonKey(name: 'free_qty')
  double? get freeQty;
  @override
  @JsonKey(name: 'incoming_qty')
  double? get incomingQty;
  @override
  @JsonKey(name: 'outgoing_qty')
  double? get outgoingQty;
  @override
  @JsonKey(name: 'virtual_available')
  double? get virtualAvailable;
  @override
  @JsonKey(name: 'warehouse_id')
  int? get warehouseId;
  @override
  @JsonKey(ignore: true)
  _$$AwsProductStocksImplCopyWith<_$AwsProductStocksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentWarehouse _$CurrentWarehouseFromJson(Map<String, dynamic> json) {
  return _CurrentWarehouse.fromJson(json);
}

/// @nodoc
mixin _$CurrentWarehouse {
  @JsonKey(name: 'warehouse_id')
  int get warehouseId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentWarehouseCopyWith<CurrentWarehouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWarehouseCopyWith<$Res> {
  factory $CurrentWarehouseCopyWith(
          CurrentWarehouse value, $Res Function(CurrentWarehouse) then) =
      _$CurrentWarehouseCopyWithImpl<$Res, CurrentWarehouse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'warehouse_id') int warehouseId,
      String? name,
      String? code});
}

/// @nodoc
class _$CurrentWarehouseCopyWithImpl<$Res, $Val extends CurrentWarehouse>
    implements $CurrentWarehouseCopyWith<$Res> {
  _$CurrentWarehouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = null,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentWarehouseImplCopyWith<$Res>
    implements $CurrentWarehouseCopyWith<$Res> {
  factory _$$CurrentWarehouseImplCopyWith(_$CurrentWarehouseImpl value,
          $Res Function(_$CurrentWarehouseImpl) then) =
      __$$CurrentWarehouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'warehouse_id') int warehouseId,
      String? name,
      String? code});
}

/// @nodoc
class __$$CurrentWarehouseImplCopyWithImpl<$Res>
    extends _$CurrentWarehouseCopyWithImpl<$Res, _$CurrentWarehouseImpl>
    implements _$$CurrentWarehouseImplCopyWith<$Res> {
  __$$CurrentWarehouseImplCopyWithImpl(_$CurrentWarehouseImpl _value,
      $Res Function(_$CurrentWarehouseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = null,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$CurrentWarehouseImpl(
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentWarehouseImpl implements _CurrentWarehouse {
  const _$CurrentWarehouseImpl(
      {@JsonKey(name: 'warehouse_id') required this.warehouseId,
      required this.name,
      required this.code});

  factory _$CurrentWarehouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWarehouseImplFromJson(json);

  @override
  @JsonKey(name: 'warehouse_id')
  final int warehouseId;
  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'CurrentWarehouse(warehouseId: $warehouseId, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWarehouseImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, warehouseId, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWarehouseImplCopyWith<_$CurrentWarehouseImpl> get copyWith =>
      __$$CurrentWarehouseImplCopyWithImpl<_$CurrentWarehouseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWarehouseImplToJson(
      this,
    );
  }
}

abstract class _CurrentWarehouse implements CurrentWarehouse {
  const factory _CurrentWarehouse(
      {@JsonKey(name: 'warehouse_id') required final int warehouseId,
      required final String? name,
      required final String? code}) = _$CurrentWarehouseImpl;

  factory _CurrentWarehouse.fromJson(Map<String, dynamic> json) =
      _$CurrentWarehouseImpl.fromJson;

  @override
  @JsonKey(name: 'warehouse_id')
  int get warehouseId;
  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$CurrentWarehouseImplCopyWith<_$CurrentWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
