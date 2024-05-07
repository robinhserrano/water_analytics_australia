// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrder _$SalesOrderFromJson(Map<String, dynamic> json) {
  return _SalesOrder.fromJson(json);
}

/// @nodoc
mixin _$SalesOrder {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError; //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate => throw _privateConstructorUsedError; //B
  @JsonKey(name: 'partner_id')
  PartnerIdModel? get partnerId => throw _privateConstructorUsedError; //C-E
  @JsonKey(name: 'x_studio_sales_rep_1')
  String get xStudioSalesRep1 => throw _privateConstructorUsedError; //F
  @JsonKey(name: 'x_studio_sales_source')
  String get xStudioSalesSource => throw _privateConstructorUsedError; //G
  @JsonKey(name: 'x_studio_commission_paid')
  bool get xStudioCommissionPaid => throw _privateConstructorUsedError; //H,
  @JsonKey(name: 'x_studio_referred_by')
  @BoolRefferedByConverter()
  ReferredByModel get xStudioReferredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'x_studio_referrer_processed')
  bool get xStudioReferrerProcessed => throw _privateConstructorUsedError; //J,
  @JsonKey(name: 'x_studio_payment_type')
  String get xStudioPaymentType => throw _privateConstructorUsedError; //K
  @JsonKey(name: 'amount_total')
  double? get amountTotal => throw _privateConstructorUsedError; // L
  @JsonKey(name: 'delivery_status')
  dynamic get deliveryStatus => throw _privateConstructorUsedError; //M
  @JsonKey(name: 'amount_to_invoice')
  double? get amountToInvoice => throw _privateConstructorUsedError; //N
  @JsonKey(name: 'x_studio_invoice_payment_status')
  dynamic get xStudioInvoicePaymentStatus =>
      throw _privateConstructorUsedError; //O
  @JsonKey(name: 'internal_note_display')
  String? get internalNoteDisplay => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrderCopyWith<SalesOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderCopyWith<$Res> {
  factory $SalesOrderCopyWith(
          SalesOrder value, $Res Function(SalesOrder) then) =
      _$SalesOrderCopyWithImpl<$Res, SalesOrder>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'partner_id') PartnerIdModel? partnerId,
      @JsonKey(name: 'x_studio_sales_rep_1') String xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      ReferredByModel xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state});

  $PartnerIdModelCopyWith<$Res>? get partnerId;
  $ReferredByModelCopyWith<$Res> get xStudioReferredBy;
}

/// @nodoc
class _$SalesOrderCopyWithImpl<$Res, $Val extends SalesOrder>
    implements $SalesOrderCopyWith<$Res> {
  _$SalesOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
    Object? partnerId = freezed,
    Object? xStudioSalesRep1 = null,
    Object? xStudioSalesSource = null,
    Object? xStudioCommissionPaid = null,
    Object? xStudioReferredBy = null,
    Object? xStudioReferrerProcessed = null,
    Object? xStudioPaymentType = null,
    Object? amountTotal = freezed,
    Object? deliveryStatus = freezed,
    Object? amountToInvoice = freezed,
    Object? xStudioInvoicePaymentStatus = freezed,
    Object? internalNoteDisplay = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as PartnerIdModel?,
      xStudioSalesRep1: null == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String,
      xStudioSalesSource: null == xStudioSalesSource
          ? _value.xStudioSalesSource
          : xStudioSalesSource // ignore: cast_nullable_to_non_nullable
              as String,
      xStudioCommissionPaid: null == xStudioCommissionPaid
          ? _value.xStudioCommissionPaid
          : xStudioCommissionPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioReferredBy: null == xStudioReferredBy
          ? _value.xStudioReferredBy
          : xStudioReferredBy // ignore: cast_nullable_to_non_nullable
              as ReferredByModel,
      xStudioReferrerProcessed: null == xStudioReferrerProcessed
          ? _value.xStudioReferrerProcessed
          : xStudioReferrerProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioPaymentType: null == xStudioPaymentType
          ? _value.xStudioPaymentType
          : xStudioPaymentType // ignore: cast_nullable_to_non_nullable
              as String,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amountToInvoice: freezed == amountToInvoice
          ? _value.amountToInvoice
          : amountToInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      xStudioInvoicePaymentStatus: freezed == xStudioInvoicePaymentStatus
          ? _value.xStudioInvoicePaymentStatus
          : xStudioInvoicePaymentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internalNoteDisplay: freezed == internalNoteDisplay
          ? _value.internalNoteDisplay
          : internalNoteDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartnerIdModelCopyWith<$Res>? get partnerId {
    if (_value.partnerId == null) {
      return null;
    }

    return $PartnerIdModelCopyWith<$Res>(_value.partnerId!, (value) {
      return _then(_value.copyWith(partnerId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferredByModelCopyWith<$Res> get xStudioReferredBy {
    return $ReferredByModelCopyWith<$Res>(_value.xStudioReferredBy, (value) {
      return _then(_value.copyWith(xStudioReferredBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrderImplCopyWith<$Res>
    implements $SalesOrderCopyWith<$Res> {
  factory _$$SalesOrderImplCopyWith(
          _$SalesOrderImpl value, $Res Function(_$SalesOrderImpl) then) =
      __$$SalesOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'partner_id') PartnerIdModel? partnerId,
      @JsonKey(name: 'x_studio_sales_rep_1') String xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      ReferredByModel xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state});

  @override
  $PartnerIdModelCopyWith<$Res>? get partnerId;
  @override
  $ReferredByModelCopyWith<$Res> get xStudioReferredBy;
}

/// @nodoc
class __$$SalesOrderImplCopyWithImpl<$Res>
    extends _$SalesOrderCopyWithImpl<$Res, _$SalesOrderImpl>
    implements _$$SalesOrderImplCopyWith<$Res> {
  __$$SalesOrderImplCopyWithImpl(
      _$SalesOrderImpl _value, $Res Function(_$SalesOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
    Object? partnerId = freezed,
    Object? xStudioSalesRep1 = null,
    Object? xStudioSalesSource = null,
    Object? xStudioCommissionPaid = null,
    Object? xStudioReferredBy = null,
    Object? xStudioReferrerProcessed = null,
    Object? xStudioPaymentType = null,
    Object? amountTotal = freezed,
    Object? deliveryStatus = freezed,
    Object? amountToInvoice = freezed,
    Object? xStudioInvoicePaymentStatus = freezed,
    Object? internalNoteDisplay = freezed,
    Object? state = freezed,
  }) {
    return _then(_$SalesOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as PartnerIdModel?,
      xStudioSalesRep1: null == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String,
      xStudioSalesSource: null == xStudioSalesSource
          ? _value.xStudioSalesSource
          : xStudioSalesSource // ignore: cast_nullable_to_non_nullable
              as String,
      xStudioCommissionPaid: null == xStudioCommissionPaid
          ? _value.xStudioCommissionPaid
          : xStudioCommissionPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioReferredBy: null == xStudioReferredBy
          ? _value.xStudioReferredBy
          : xStudioReferredBy // ignore: cast_nullable_to_non_nullable
              as ReferredByModel,
      xStudioReferrerProcessed: null == xStudioReferrerProcessed
          ? _value.xStudioReferrerProcessed
          : xStudioReferrerProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioPaymentType: null == xStudioPaymentType
          ? _value.xStudioPaymentType
          : xStudioPaymentType // ignore: cast_nullable_to_non_nullable
              as String,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amountToInvoice: freezed == amountToInvoice
          ? _value.amountToInvoice
          : amountToInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      xStudioInvoicePaymentStatus: freezed == xStudioInvoicePaymentStatus
          ? _value.xStudioInvoicePaymentStatus
          : xStudioInvoicePaymentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internalNoteDisplay: freezed == internalNoteDisplay
          ? _value.internalNoteDisplay
          : internalNoteDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderImpl implements _SalesOrder {
  const _$SalesOrderImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'create_date') required this.createDate,
      @JsonKey(name: 'partner_id') required this.partnerId,
      @JsonKey(name: 'x_studio_sales_rep_1') required this.xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') required this.xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      required this.xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      required this.xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      required this.xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') required this.xStudioPaymentType,
      @JsonKey(name: 'amount_total') required this.amountTotal,
      @JsonKey(name: 'delivery_status') required this.deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') required this.amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      required this.xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') required this.internalNoteDisplay,
      required this.state});

  factory _$SalesOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
//A
  @override
  @JsonKey(name: 'create_date')
  final DateTime? createDate;
//B
  @override
  @JsonKey(name: 'partner_id')
  final PartnerIdModel? partnerId;
//C-E
  @override
  @JsonKey(name: 'x_studio_sales_rep_1')
  final String xStudioSalesRep1;
//F
  @override
  @JsonKey(name: 'x_studio_sales_source')
  final String xStudioSalesSource;
//G
  @override
  @JsonKey(name: 'x_studio_commission_paid')
  final bool xStudioCommissionPaid;
//H,
  @override
  @JsonKey(name: 'x_studio_referred_by')
  @BoolRefferedByConverter()
  final ReferredByModel xStudioReferredBy;
  @override
  @JsonKey(name: 'x_studio_referrer_processed')
  final bool xStudioReferrerProcessed;
//J,
  @override
  @JsonKey(name: 'x_studio_payment_type')
  final String xStudioPaymentType;
//K
  @override
  @JsonKey(name: 'amount_total')
  final double? amountTotal;
// L
  @override
  @JsonKey(name: 'delivery_status')
  final dynamic deliveryStatus;
//M
  @override
  @JsonKey(name: 'amount_to_invoice')
  final double? amountToInvoice;
//N
  @override
  @JsonKey(name: 'x_studio_invoice_payment_status')
  final dynamic xStudioInvoicePaymentStatus;
//O
  @override
  @JsonKey(name: 'internal_note_display')
  final String? internalNoteDisplay;
  @override
  final String? state;

  @override
  String toString() {
    return 'SalesOrder(id: $id, name: $name, createDate: $createDate, partnerId: $partnerId, xStudioSalesRep1: $xStudioSalesRep1, xStudioSalesSource: $xStudioSalesSource, xStudioCommissionPaid: $xStudioCommissionPaid, xStudioReferredBy: $xStudioReferredBy, xStudioReferrerProcessed: $xStudioReferrerProcessed, xStudioPaymentType: $xStudioPaymentType, amountTotal: $amountTotal, deliveryStatus: $deliveryStatus, amountToInvoice: $amountToInvoice, xStudioInvoicePaymentStatus: $xStudioInvoicePaymentStatus, internalNoteDisplay: $internalNoteDisplay, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.xStudioSalesRep1, xStudioSalesRep1) ||
                other.xStudioSalesRep1 == xStudioSalesRep1) &&
            (identical(other.xStudioSalesSource, xStudioSalesSource) ||
                other.xStudioSalesSource == xStudioSalesSource) &&
            (identical(other.xStudioCommissionPaid, xStudioCommissionPaid) ||
                other.xStudioCommissionPaid == xStudioCommissionPaid) &&
            (identical(other.xStudioReferredBy, xStudioReferredBy) ||
                other.xStudioReferredBy == xStudioReferredBy) &&
            (identical(
                    other.xStudioReferrerProcessed, xStudioReferrerProcessed) ||
                other.xStudioReferrerProcessed == xStudioReferrerProcessed) &&
            (identical(other.xStudioPaymentType, xStudioPaymentType) ||
                other.xStudioPaymentType == xStudioPaymentType) &&
            (identical(other.amountTotal, amountTotal) ||
                other.amountTotal == amountTotal) &&
            const DeepCollectionEquality()
                .equals(other.deliveryStatus, deliveryStatus) &&
            (identical(other.amountToInvoice, amountToInvoice) ||
                other.amountToInvoice == amountToInvoice) &&
            const DeepCollectionEquality().equals(
                other.xStudioInvoicePaymentStatus,
                xStudioInvoicePaymentStatus) &&
            (identical(other.internalNoteDisplay, internalNoteDisplay) ||
                other.internalNoteDisplay == internalNoteDisplay) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createDate,
      partnerId,
      xStudioSalesRep1,
      xStudioSalesSource,
      xStudioCommissionPaid,
      xStudioReferredBy,
      xStudioReferrerProcessed,
      xStudioPaymentType,
      amountTotal,
      const DeepCollectionEquality().hash(deliveryStatus),
      amountToInvoice,
      const DeepCollectionEquality().hash(xStudioInvoicePaymentStatus),
      internalNoteDisplay,
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      __$$SalesOrderImplCopyWithImpl<_$SalesOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderImplToJson(
      this,
    );
  }
}

abstract class _SalesOrder implements SalesOrder {
  const factory _SalesOrder(
      {required final int? id,
      required final String? name,
      @JsonKey(name: 'create_date') required final DateTime? createDate,
      @JsonKey(name: 'partner_id') required final PartnerIdModel? partnerId,
      @JsonKey(name: 'x_studio_sales_rep_1')
      required final String xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source')
      required final String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      required final bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      required final ReferredByModel xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      required final bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type')
      required final String xStudioPaymentType,
      @JsonKey(name: 'amount_total') required final double? amountTotal,
      @JsonKey(name: 'delivery_status') required final dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice')
      required final double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      required final dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display')
      required final String? internalNoteDisplay,
      required final String? state}) = _$SalesOrderImpl;

  factory _SalesOrder.fromJson(Map<String, dynamic> json) =
      _$SalesOrderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate;
  @override //B
  @JsonKey(name: 'partner_id')
  PartnerIdModel? get partnerId;
  @override //C-E
  @JsonKey(name: 'x_studio_sales_rep_1')
  String get xStudioSalesRep1;
  @override //F
  @JsonKey(name: 'x_studio_sales_source')
  String get xStudioSalesSource;
  @override //G
  @JsonKey(name: 'x_studio_commission_paid')
  bool get xStudioCommissionPaid;
  @override //H,
  @JsonKey(name: 'x_studio_referred_by')
  @BoolRefferedByConverter()
  ReferredByModel get xStudioReferredBy;
  @override
  @JsonKey(name: 'x_studio_referrer_processed')
  bool get xStudioReferrerProcessed;
  @override //J,
  @JsonKey(name: 'x_studio_payment_type')
  String get xStudioPaymentType;
  @override //K
  @JsonKey(name: 'amount_total')
  double? get amountTotal;
  @override // L
  @JsonKey(name: 'delivery_status')
  dynamic get deliveryStatus;
  @override //M
  @JsonKey(name: 'amount_to_invoice')
  double? get amountToInvoice;
  @override //N
  @JsonKey(name: 'x_studio_invoice_payment_status')
  dynamic get xStudioInvoicePaymentStatus;
  @override //O
  @JsonKey(name: 'internal_note_display')
  String? get internalNoteDisplay;
  @override
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartnerIdModel _$PartnerIdModelFromJson(Map<String, dynamic> json) {
  return _PartnerIdModel.fromJson(json);
}

/// @nodoc
mixin _$PartnerIdModel {
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_address')
  dynamic get contactAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  dynamic get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerIdModelCopyWith<PartnerIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerIdModelCopyWith<$Res> {
  factory $PartnerIdModelCopyWith(
          PartnerIdModel value, $Res Function(PartnerIdModel) then) =
      _$PartnerIdModelCopyWithImpl<$Res, PartnerIdModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'contact_address') dynamic contactAddress,
      @JsonKey(name: 'phone') dynamic phone});
}

/// @nodoc
class _$PartnerIdModelCopyWithImpl<$Res, $Val extends PartnerIdModel>
    implements $PartnerIdModelCopyWith<$Res> {
  _$PartnerIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? contactAddress = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAddress: freezed == contactAddress
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartnerIdModelImplCopyWith<$Res>
    implements $PartnerIdModelCopyWith<$Res> {
  factory _$$PartnerIdModelImplCopyWith(_$PartnerIdModelImpl value,
          $Res Function(_$PartnerIdModelImpl) then) =
      __$$PartnerIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'contact_address') dynamic contactAddress,
      @JsonKey(name: 'phone') dynamic phone});
}

/// @nodoc
class __$$PartnerIdModelImplCopyWithImpl<$Res>
    extends _$PartnerIdModelCopyWithImpl<$Res, _$PartnerIdModelImpl>
    implements _$$PartnerIdModelImplCopyWith<$Res> {
  __$$PartnerIdModelImplCopyWithImpl(
      _$PartnerIdModelImpl _value, $Res Function(_$PartnerIdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? contactAddress = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$PartnerIdModelImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAddress: freezed == contactAddress
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerIdModelImpl implements _PartnerIdModel {
  const _$PartnerIdModelImpl(
      {@JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'contact_address') required this.contactAddress,
      @JsonKey(name: 'phone') required this.phone});

  factory _$PartnerIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerIdModelImplFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @JsonKey(name: 'contact_address')
  final dynamic contactAddress;
  @override
  @JsonKey(name: 'phone')
  final dynamic phone;

  @override
  String toString() {
    return 'PartnerIdModel(displayName: $displayName, contactAddress: $contactAddress, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerIdModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality()
                .equals(other.contactAddress, contactAddress) &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayName,
      const DeepCollectionEquality().hash(contactAddress),
      const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerIdModelImplCopyWith<_$PartnerIdModelImpl> get copyWith =>
      __$$PartnerIdModelImplCopyWithImpl<_$PartnerIdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerIdModelImplToJson(
      this,
    );
  }
}

abstract class _PartnerIdModel implements PartnerIdModel {
  const factory _PartnerIdModel(
      {@JsonKey(name: 'display_name') required final String? displayName,
      @JsonKey(name: 'contact_address') required final dynamic contactAddress,
      @JsonKey(name: 'phone')
      required final dynamic phone}) = _$PartnerIdModelImpl;

  factory _PartnerIdModel.fromJson(Map<String, dynamic> json) =
      _$PartnerIdModelImpl.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(name: 'contact_address')
  dynamic get contactAddress;
  @override
  @JsonKey(name: 'phone')
  dynamic get phone;
  @override
  @JsonKey(ignore: true)
  _$$PartnerIdModelImplCopyWith<_$PartnerIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferredByModel _$ReferredByModelFromJson(Map<String, dynamic> json) {
  return _ReferredByModel.fromJson(json);
}

/// @nodoc
mixin _$ReferredByModel {
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferredByModelCopyWith<ReferredByModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferredByModelCopyWith<$Res> {
  factory $ReferredByModelCopyWith(
          ReferredByModel value, $Res Function(ReferredByModel) then) =
      _$ReferredByModelCopyWithImpl<$Res, ReferredByModel>;
  @useResult
  $Res call({@JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class _$ReferredByModelCopyWithImpl<$Res, $Val extends ReferredByModel>
    implements $ReferredByModelCopyWith<$Res> {
  _$ReferredByModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferredByModelImplCopyWith<$Res>
    implements $ReferredByModelCopyWith<$Res> {
  factory _$$ReferredByModelImplCopyWith(_$ReferredByModelImpl value,
          $Res Function(_$ReferredByModelImpl) then) =
      __$$ReferredByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class __$$ReferredByModelImplCopyWithImpl<$Res>
    extends _$ReferredByModelCopyWithImpl<$Res, _$ReferredByModelImpl>
    implements _$$ReferredByModelImplCopyWith<$Res> {
  __$$ReferredByModelImplCopyWithImpl(
      _$ReferredByModelImpl _value, $Res Function(_$ReferredByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
  }) {
    return _then(_$ReferredByModelImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferredByModelImpl implements _ReferredByModel {
  const _$ReferredByModelImpl(
      {@JsonKey(name: 'display_name') required this.displayName});

  factory _$ReferredByModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferredByModelImplFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String? displayName;

  @override
  String toString() {
    return 'ReferredByModel(displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferredByModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferredByModelImplCopyWith<_$ReferredByModelImpl> get copyWith =>
      __$$ReferredByModelImplCopyWithImpl<_$ReferredByModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferredByModelImplToJson(
      this,
    );
  }
}

abstract class _ReferredByModel implements ReferredByModel {
  const factory _ReferredByModel(
          {@JsonKey(name: 'display_name') required final String? displayName}) =
      _$ReferredByModelImpl;

  factory _ReferredByModel.fromJson(Map<String, dynamic> json) =
      _$ReferredByModelImpl.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$ReferredByModelImplCopyWith<_$ReferredByModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
