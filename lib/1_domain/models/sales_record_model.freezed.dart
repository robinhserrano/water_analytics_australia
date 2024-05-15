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
  @BoolStringConverter()
  String? get xStudioSalesRep1 => throw _privateConstructorUsedError; //F
  @JsonKey(name: 'x_studio_sales_source')
  String get xStudioSalesSource => throw _privateConstructorUsedError; //G
  @JsonKey(name: 'x_studio_commission_paid')
  bool get xStudioCommissionPaid => throw _privateConstructorUsedError; //H,
  @JsonKey(name: 'x_studio_referred_by')
  @BoolRefferedByConverter()
  DisplayNameModel get xStudioReferredBy => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'user_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_line')
  List<OrderLine>? get orderLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_ids')
  List<TagIdModel>? get tagIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_totals')
  TaxTotalsModel? get taxTotals => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'x_studio_sales_rep_1')
      @BoolStringConverter()
      String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      DisplayNameModel xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'user_id')
      @BoolRefferedByConverter()
      DisplayNameModel? userId,
      @JsonKey(name: 'team_id')
      @BoolRefferedByConverter()
      DisplayNameModel? teamId,
      @JsonKey(name: 'order_line') List<OrderLine>? orderLine,
      @JsonKey(name: 'tag_ids') List<TagIdModel>? tagIds,
      @JsonKey(name: 'tax_totals') TaxTotalsModel? taxTotals});

  $PartnerIdModelCopyWith<$Res>? get partnerId;
  $DisplayNameModelCopyWith<$Res> get xStudioReferredBy;
  $DisplayNameModelCopyWith<$Res>? get userId;
  $DisplayNameModelCopyWith<$Res>? get teamId;
  $TaxTotalsModelCopyWith<$Res>? get taxTotals;
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
    Object? xStudioSalesRep1 = freezed,
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
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? orderLine = freezed,
    Object? tagIds = freezed,
    Object? taxTotals = freezed,
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
      xStudioSalesRep1: freezed == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DisplayNameModel,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      orderLine: freezed == orderLine
          ? _value.orderLine
          : orderLine // ignore: cast_nullable_to_non_nullable
              as List<OrderLine>?,
      tagIds: freezed == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagIdModel>?,
      taxTotals: freezed == taxTotals
          ? _value.taxTotals
          : taxTotals // ignore: cast_nullable_to_non_nullable
              as TaxTotalsModel?,
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
  $DisplayNameModelCopyWith<$Res> get xStudioReferredBy {
    return $DisplayNameModelCopyWith<$Res>(_value.xStudioReferredBy, (value) {
      return _then(_value.copyWith(xStudioReferredBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $DisplayNameModelCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res>? get teamId {
    if (_value.teamId == null) {
      return null;
    }

    return $DisplayNameModelCopyWith<$Res>(_value.teamId!, (value) {
      return _then(_value.copyWith(teamId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxTotalsModelCopyWith<$Res>? get taxTotals {
    if (_value.taxTotals == null) {
      return null;
    }

    return $TaxTotalsModelCopyWith<$Res>(_value.taxTotals!, (value) {
      return _then(_value.copyWith(taxTotals: value) as $Val);
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
      @JsonKey(name: 'x_studio_sales_rep_1')
      @BoolStringConverter()
      String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      DisplayNameModel xStudioReferredBy,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'user_id')
      @BoolRefferedByConverter()
      DisplayNameModel? userId,
      @JsonKey(name: 'team_id')
      @BoolRefferedByConverter()
      DisplayNameModel? teamId,
      @JsonKey(name: 'order_line') List<OrderLine>? orderLine,
      @JsonKey(name: 'tag_ids') List<TagIdModel>? tagIds,
      @JsonKey(name: 'tax_totals') TaxTotalsModel? taxTotals});

  @override
  $PartnerIdModelCopyWith<$Res>? get partnerId;
  @override
  $DisplayNameModelCopyWith<$Res> get xStudioReferredBy;
  @override
  $DisplayNameModelCopyWith<$Res>? get userId;
  @override
  $DisplayNameModelCopyWith<$Res>? get teamId;
  @override
  $TaxTotalsModelCopyWith<$Res>? get taxTotals;
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
    Object? xStudioSalesRep1 = freezed,
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
    Object? userId = freezed,
    Object? teamId = freezed,
    Object? orderLine = freezed,
    Object? tagIds = freezed,
    Object? taxTotals = freezed,
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
      xStudioSalesRep1: freezed == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DisplayNameModel,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      orderLine: freezed == orderLine
          ? _value._orderLine
          : orderLine // ignore: cast_nullable_to_non_nullable
              as List<OrderLine>?,
      tagIds: freezed == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagIdModel>?,
      taxTotals: freezed == taxTotals
          ? _value.taxTotals
          : taxTotals // ignore: cast_nullable_to_non_nullable
              as TaxTotalsModel?,
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
      @JsonKey(name: 'x_studio_sales_rep_1')
      @BoolStringConverter()
      required this.xStudioSalesRep1,
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
      required this.state,
      @JsonKey(name: 'user_id') @BoolRefferedByConverter() required this.userId,
      @JsonKey(name: 'team_id') @BoolRefferedByConverter() required this.teamId,
      @JsonKey(name: 'order_line') required final List<OrderLine>? orderLine,
      @JsonKey(name: 'tag_ids') required final List<TagIdModel>? tagIds,
      @JsonKey(name: 'tax_totals') required this.taxTotals})
      : _orderLine = orderLine,
        _tagIds = tagIds;

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
  @BoolStringConverter()
  final String? xStudioSalesRep1;
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
  final DisplayNameModel xStudioReferredBy;
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
  @JsonKey(name: 'user_id')
  @BoolRefferedByConverter()
  final DisplayNameModel? userId;
  @override
  @JsonKey(name: 'team_id')
  @BoolRefferedByConverter()
  final DisplayNameModel? teamId;
  final List<OrderLine>? _orderLine;
  @override
  @JsonKey(name: 'order_line')
  List<OrderLine>? get orderLine {
    final value = _orderLine;
    if (value == null) return null;
    if (_orderLine is EqualUnmodifiableListView) return _orderLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagIdModel>? _tagIds;
  @override
  @JsonKey(name: 'tag_ids')
  List<TagIdModel>? get tagIds {
    final value = _tagIds;
    if (value == null) return null;
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'tax_totals')
  final TaxTotalsModel? taxTotals;

  @override
  String toString() {
    return 'SalesOrder(id: $id, name: $name, createDate: $createDate, partnerId: $partnerId, xStudioSalesRep1: $xStudioSalesRep1, xStudioSalesSource: $xStudioSalesSource, xStudioCommissionPaid: $xStudioCommissionPaid, xStudioReferredBy: $xStudioReferredBy, xStudioReferrerProcessed: $xStudioReferrerProcessed, xStudioPaymentType: $xStudioPaymentType, amountTotal: $amountTotal, deliveryStatus: $deliveryStatus, amountToInvoice: $amountToInvoice, xStudioInvoicePaymentStatus: $xStudioInvoicePaymentStatus, internalNoteDisplay: $internalNoteDisplay, state: $state, userId: $userId, teamId: $teamId, orderLine: $orderLine, tagIds: $tagIds, taxTotals: $taxTotals)';
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
            (identical(other.state, state) || other.state == state) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            const DeepCollectionEquality()
                .equals(other._orderLine, _orderLine) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds) &&
            (identical(other.taxTotals, taxTotals) ||
                other.taxTotals == taxTotals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
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
        state,
        userId,
        teamId,
        const DeepCollectionEquality().hash(_orderLine),
        const DeepCollectionEquality().hash(_tagIds),
        taxTotals
      ]);

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
      @BoolStringConverter()
      required final String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source')
      required final String xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      required final bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referred_by')
      @BoolRefferedByConverter()
      required final DisplayNameModel xStudioReferredBy,
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
      required final String? state,
      @JsonKey(name: 'user_id')
      @BoolRefferedByConverter()
      required final DisplayNameModel? userId,
      @JsonKey(name: 'team_id')
      @BoolRefferedByConverter()
      required final DisplayNameModel? teamId,
      @JsonKey(name: 'order_line') required final List<OrderLine>? orderLine,
      @JsonKey(name: 'tag_ids') required final List<TagIdModel>? tagIds,
      @JsonKey(name: 'tax_totals')
      required final TaxTotalsModel? taxTotals}) = _$SalesOrderImpl;

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
  @BoolStringConverter()
  String? get xStudioSalesRep1;
  @override //F
  @JsonKey(name: 'x_studio_sales_source')
  String get xStudioSalesSource;
  @override //G
  @JsonKey(name: 'x_studio_commission_paid')
  bool get xStudioCommissionPaid;
  @override //H,
  @JsonKey(name: 'x_studio_referred_by')
  @BoolRefferedByConverter()
  DisplayNameModel get xStudioReferredBy;
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
  @JsonKey(name: 'user_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get userId;
  @override
  @JsonKey(name: 'team_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get teamId;
  @override
  @JsonKey(name: 'order_line')
  List<OrderLine>? get orderLine;
  @override
  @JsonKey(name: 'tag_ids')
  List<TagIdModel>? get tagIds;
  @override
  @JsonKey(name: 'tax_totals')
  TaxTotalsModel? get taxTotals;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderLine _$OrderLineFromJson(Map<String, dynamic> json) {
  return _OrderLine.fromJson(json);
}

/// @nodoc
mixin _$OrderLine {
  @JsonKey(name: 'product_template_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get productTemplateId =>
      throw _privateConstructorUsedError; //B
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError; //C-E
  @JsonKey(name: 'product_uom_qty')
  double? get productUomQty => throw _privateConstructorUsedError; //F
  @JsonKey(name: 'qty_delivered')
  double? get qtyDelivered => throw _privateConstructorUsedError; //G
  @JsonKey(name: 'qty_invoiced')
  double? get qtyInvoiced => throw _privateConstructorUsedError; //H,
  @JsonKey(name: 'price_unit')
  double? get priceUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  @BoolRefferedByConverter()
  List<DisplayNameModel>? get taxId => throw _privateConstructorUsedError; //J,
  @JsonKey(name: 'discount')
  double? get discount => throw _privateConstructorUsedError; //K
  @JsonKey(name: 'price_subtotal')
  double? get priceSubtotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderLineCopyWith<OrderLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineCopyWith<$Res> {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) then) =
      _$OrderLineCopyWithImpl<$Res, OrderLine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_template_id')
      @BoolRefferedByConverter()
      DisplayNameModel? productTemplateId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'product_uom_qty') double? productUomQty,
      @JsonKey(name: 'qty_delivered') double? qtyDelivered,
      @JsonKey(name: 'qty_invoiced') double? qtyInvoiced,
      @JsonKey(name: 'price_unit') double? priceUnit,
      @JsonKey(name: 'tax_id')
      @BoolRefferedByConverter()
      List<DisplayNameModel>? taxId,
      @JsonKey(name: 'discount') double? discount,
      @JsonKey(name: 'price_subtotal') double? priceSubtotal});

  $DisplayNameModelCopyWith<$Res>? get productTemplateId;
}

/// @nodoc
class _$OrderLineCopyWithImpl<$Res, $Val extends OrderLine>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTemplateId = freezed,
    Object? name = freezed,
    Object? productUomQty = freezed,
    Object? qtyDelivered = freezed,
    Object? qtyInvoiced = freezed,
    Object? priceUnit = freezed,
    Object? taxId = freezed,
    Object? discount = freezed,
    Object? priceSubtotal = freezed,
  }) {
    return _then(_value.copyWith(
      productTemplateId: freezed == productTemplateId
          ? _value.productTemplateId
          : productTemplateId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      productUomQty: freezed == productUomQty
          ? _value.productUomQty
          : productUomQty // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyDelivered: freezed == qtyDelivered
          ? _value.qtyDelivered
          : qtyDelivered // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyInvoiced: freezed == qtyInvoiced
          ? _value.qtyInvoiced
          : qtyInvoiced // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUnit: freezed == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as List<DisplayNameModel>?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSubtotal: freezed == priceSubtotal
          ? _value.priceSubtotal
          : priceSubtotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res>? get productTemplateId {
    if (_value.productTemplateId == null) {
      return null;
    }

    return $DisplayNameModelCopyWith<$Res>(_value.productTemplateId!, (value) {
      return _then(_value.copyWith(productTemplateId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderLineImplCopyWith<$Res>
    implements $OrderLineCopyWith<$Res> {
  factory _$$OrderLineImplCopyWith(
          _$OrderLineImpl value, $Res Function(_$OrderLineImpl) then) =
      __$$OrderLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_template_id')
      @BoolRefferedByConverter()
      DisplayNameModel? productTemplateId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'product_uom_qty') double? productUomQty,
      @JsonKey(name: 'qty_delivered') double? qtyDelivered,
      @JsonKey(name: 'qty_invoiced') double? qtyInvoiced,
      @JsonKey(name: 'price_unit') double? priceUnit,
      @JsonKey(name: 'tax_id')
      @BoolRefferedByConverter()
      List<DisplayNameModel>? taxId,
      @JsonKey(name: 'discount') double? discount,
      @JsonKey(name: 'price_subtotal') double? priceSubtotal});

  @override
  $DisplayNameModelCopyWith<$Res>? get productTemplateId;
}

/// @nodoc
class __$$OrderLineImplCopyWithImpl<$Res>
    extends _$OrderLineCopyWithImpl<$Res, _$OrderLineImpl>
    implements _$$OrderLineImplCopyWith<$Res> {
  __$$OrderLineImplCopyWithImpl(
      _$OrderLineImpl _value, $Res Function(_$OrderLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTemplateId = freezed,
    Object? name = freezed,
    Object? productUomQty = freezed,
    Object? qtyDelivered = freezed,
    Object? qtyInvoiced = freezed,
    Object? priceUnit = freezed,
    Object? taxId = freezed,
    Object? discount = freezed,
    Object? priceSubtotal = freezed,
  }) {
    return _then(_$OrderLineImpl(
      productTemplateId: freezed == productTemplateId
          ? _value.productTemplateId
          : productTemplateId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      productUomQty: freezed == productUomQty
          ? _value.productUomQty
          : productUomQty // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyDelivered: freezed == qtyDelivered
          ? _value.qtyDelivered
          : qtyDelivered // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyInvoiced: freezed == qtyInvoiced
          ? _value.qtyInvoiced
          : qtyInvoiced // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUnit: freezed == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxId: freezed == taxId
          ? _value._taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as List<DisplayNameModel>?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSubtotal: freezed == priceSubtotal
          ? _value.priceSubtotal
          : priceSubtotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineImpl implements _OrderLine {
  const _$OrderLineImpl(
      {@JsonKey(name: 'product_template_id')
      @BoolRefferedByConverter()
      required this.productTemplateId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'product_uom_qty') required this.productUomQty,
      @JsonKey(name: 'qty_delivered') required this.qtyDelivered,
      @JsonKey(name: 'qty_invoiced') required this.qtyInvoiced,
      @JsonKey(name: 'price_unit') required this.priceUnit,
      @JsonKey(name: 'tax_id')
      @BoolRefferedByConverter()
      required final List<DisplayNameModel>? taxId,
      @JsonKey(name: 'discount') required this.discount,
      @JsonKey(name: 'price_subtotal') required this.priceSubtotal})
      : _taxId = taxId;

  factory _$OrderLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineImplFromJson(json);

  @override
  @JsonKey(name: 'product_template_id')
  @BoolRefferedByConverter()
  final DisplayNameModel? productTemplateId;
//B
  @override
  @JsonKey(name: 'name')
  final String? name;
//C-E
  @override
  @JsonKey(name: 'product_uom_qty')
  final double? productUomQty;
//F
  @override
  @JsonKey(name: 'qty_delivered')
  final double? qtyDelivered;
//G
  @override
  @JsonKey(name: 'qty_invoiced')
  final double? qtyInvoiced;
//H,
  @override
  @JsonKey(name: 'price_unit')
  final double? priceUnit;
  final List<DisplayNameModel>? _taxId;
  @override
  @JsonKey(name: 'tax_id')
  @BoolRefferedByConverter()
  List<DisplayNameModel>? get taxId {
    final value = _taxId;
    if (value == null) return null;
    if (_taxId is EqualUnmodifiableListView) return _taxId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

//J,
  @override
  @JsonKey(name: 'discount')
  final double? discount;
//K
  @override
  @JsonKey(name: 'price_subtotal')
  final double? priceSubtotal;

  @override
  String toString() {
    return 'OrderLine(productTemplateId: $productTemplateId, name: $name, productUomQty: $productUomQty, qtyDelivered: $qtyDelivered, qtyInvoiced: $qtyInvoiced, priceUnit: $priceUnit, taxId: $taxId, discount: $discount, priceSubtotal: $priceSubtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineImpl &&
            (identical(other.productTemplateId, productTemplateId) ||
                other.productTemplateId == productTemplateId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productUomQty, productUomQty) ||
                other.productUomQty == productUomQty) &&
            (identical(other.qtyDelivered, qtyDelivered) ||
                other.qtyDelivered == qtyDelivered) &&
            (identical(other.qtyInvoiced, qtyInvoiced) ||
                other.qtyInvoiced == qtyInvoiced) &&
            (identical(other.priceUnit, priceUnit) ||
                other.priceUnit == priceUnit) &&
            const DeepCollectionEquality().equals(other._taxId, _taxId) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.priceSubtotal, priceSubtotal) ||
                other.priceSubtotal == priceSubtotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productTemplateId,
      name,
      productUomQty,
      qtyDelivered,
      qtyInvoiced,
      priceUnit,
      const DeepCollectionEquality().hash(_taxId),
      discount,
      priceSubtotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineImplCopyWith<_$OrderLineImpl> get copyWith =>
      __$$OrderLineImplCopyWithImpl<_$OrderLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineImplToJson(
      this,
    );
  }
}

abstract class _OrderLine implements OrderLine {
  const factory _OrderLine(
      {@JsonKey(name: 'product_template_id')
      @BoolRefferedByConverter()
      required final DisplayNameModel? productTemplateId,
      @JsonKey(name: 'name') required final String? name,
      @JsonKey(name: 'product_uom_qty') required final double? productUomQty,
      @JsonKey(name: 'qty_delivered') required final double? qtyDelivered,
      @JsonKey(name: 'qty_invoiced') required final double? qtyInvoiced,
      @JsonKey(name: 'price_unit') required final double? priceUnit,
      @JsonKey(name: 'tax_id')
      @BoolRefferedByConverter()
      required final List<DisplayNameModel>? taxId,
      @JsonKey(name: 'discount') required final double? discount,
      @JsonKey(name: 'price_subtotal')
      required final double? priceSubtotal}) = _$OrderLineImpl;

  factory _OrderLine.fromJson(Map<String, dynamic> json) =
      _$OrderLineImpl.fromJson;

  @override
  @JsonKey(name: 'product_template_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get productTemplateId;
  @override //B
  @JsonKey(name: 'name')
  String? get name;
  @override //C-E
  @JsonKey(name: 'product_uom_qty')
  double? get productUomQty;
  @override //F
  @JsonKey(name: 'qty_delivered')
  double? get qtyDelivered;
  @override //G
  @JsonKey(name: 'qty_invoiced')
  double? get qtyInvoiced;
  @override //H,
  @JsonKey(name: 'price_unit')
  double? get priceUnit;
  @override
  @JsonKey(name: 'tax_id')
  @BoolRefferedByConverter()
  List<DisplayNameModel>? get taxId;
  @override //J,
  @JsonKey(name: 'discount')
  double? get discount;
  @override //K
  @JsonKey(name: 'price_subtotal')
  double? get priceSubtotal;
  @override
  @JsonKey(ignore: true)
  _$$OrderLineImplCopyWith<_$OrderLineImpl> get copyWith =>
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

DisplayNameModel _$DisplayNameModelFromJson(Map<String, dynamic> json) {
  return _DisplayNameModel.fromJson(json);
}

/// @nodoc
mixin _$DisplayNameModel {
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisplayNameModelCopyWith<DisplayNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayNameModelCopyWith<$Res> {
  factory $DisplayNameModelCopyWith(
          DisplayNameModel value, $Res Function(DisplayNameModel) then) =
      _$DisplayNameModelCopyWithImpl<$Res, DisplayNameModel>;
  @useResult
  $Res call({@JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class _$DisplayNameModelCopyWithImpl<$Res, $Val extends DisplayNameModel>
    implements $DisplayNameModelCopyWith<$Res> {
  _$DisplayNameModelCopyWithImpl(this._value, this._then);

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
abstract class _$$DisplayNameModelImplCopyWith<$Res>
    implements $DisplayNameModelCopyWith<$Res> {
  factory _$$DisplayNameModelImplCopyWith(_$DisplayNameModelImpl value,
          $Res Function(_$DisplayNameModelImpl) then) =
      __$$DisplayNameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class __$$DisplayNameModelImplCopyWithImpl<$Res>
    extends _$DisplayNameModelCopyWithImpl<$Res, _$DisplayNameModelImpl>
    implements _$$DisplayNameModelImplCopyWith<$Res> {
  __$$DisplayNameModelImplCopyWithImpl(_$DisplayNameModelImpl _value,
      $Res Function(_$DisplayNameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
  }) {
    return _then(_$DisplayNameModelImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayNameModelImpl implements _DisplayNameModel {
  const _$DisplayNameModelImpl(
      {@JsonKey(name: 'display_name') required this.displayName});

  factory _$DisplayNameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayNameModelImplFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String? displayName;

  @override
  String toString() {
    return 'DisplayNameModel(displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayNameModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayNameModelImplCopyWith<_$DisplayNameModelImpl> get copyWith =>
      __$$DisplayNameModelImplCopyWithImpl<_$DisplayNameModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayNameModelImplToJson(
      this,
    );
  }
}

abstract class _DisplayNameModel implements DisplayNameModel {
  const factory _DisplayNameModel(
          {@JsonKey(name: 'display_name') required final String? displayName}) =
      _$DisplayNameModelImpl;

  factory _DisplayNameModel.fromJson(Map<String, dynamic> json) =
      _$DisplayNameModelImpl.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$DisplayNameModelImplCopyWith<_$DisplayNameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagIdModel _$TagIdModelFromJson(Map<String, dynamic> json) {
  return _TagIdModel.fromJson(json);
}

/// @nodoc
mixin _$TagIdModel {
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  int? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagIdModelCopyWith<TagIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagIdModelCopyWith<$Res> {
  factory $TagIdModelCopyWith(
          TagIdModel value, $Res Function(TagIdModel) then) =
      _$TagIdModelCopyWithImpl<$Res, TagIdModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'color') int? color});
}

/// @nodoc
class _$TagIdModelCopyWithImpl<$Res, $Val extends TagIdModel>
    implements $TagIdModelCopyWith<$Res> {
  _$TagIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagIdModelImplCopyWith<$Res>
    implements $TagIdModelCopyWith<$Res> {
  factory _$$TagIdModelImplCopyWith(
          _$TagIdModelImpl value, $Res Function(_$TagIdModelImpl) then) =
      __$$TagIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'display_name') String? displayName,
      @JsonKey(name: 'color') int? color});
}

/// @nodoc
class __$$TagIdModelImplCopyWithImpl<$Res>
    extends _$TagIdModelCopyWithImpl<$Res, _$TagIdModelImpl>
    implements _$$TagIdModelImplCopyWith<$Res> {
  __$$TagIdModelImplCopyWithImpl(
      _$TagIdModelImpl _value, $Res Function(_$TagIdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? color = freezed,
  }) {
    return _then(_$TagIdModelImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagIdModelImpl implements _TagIdModel {
  const _$TagIdModelImpl(
      {@JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'color') required this.color});

  factory _$TagIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagIdModelImplFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @JsonKey(name: 'color')
  final int? color;

  @override
  String toString() {
    return 'TagIdModel(displayName: $displayName, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagIdModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagIdModelImplCopyWith<_$TagIdModelImpl> get copyWith =>
      __$$TagIdModelImplCopyWithImpl<_$TagIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagIdModelImplToJson(
      this,
    );
  }
}

abstract class _TagIdModel implements TagIdModel {
  const factory _TagIdModel(
      {@JsonKey(name: 'display_name') required final String? displayName,
      @JsonKey(name: 'color') required final int? color}) = _$TagIdModelImpl;

  factory _TagIdModel.fromJson(Map<String, dynamic> json) =
      _$TagIdModelImpl.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(name: 'color')
  int? get color;
  @override
  @JsonKey(ignore: true)
  _$$TagIdModelImplCopyWith<_$TagIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxTotalsModel _$TaxTotalsModelFromJson(Map<String, dynamic> json) {
  return _TaxTotalsModel.fromJson(json);
}

/// @nodoc
mixin _$TaxTotalsModel {
  @JsonKey(name: 'amount_untaxed')
  double? get amountUntaxed => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_total')
  double? get amountTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxTotalsModelCopyWith<TaxTotalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxTotalsModelCopyWith<$Res> {
  factory $TaxTotalsModelCopyWith(
          TaxTotalsModel value, $Res Function(TaxTotalsModel) then) =
      _$TaxTotalsModelCopyWithImpl<$Res, TaxTotalsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount_untaxed') double? amountUntaxed,
      @JsonKey(name: 'amount_total') double? amountTotal});
}

/// @nodoc
class _$TaxTotalsModelCopyWithImpl<$Res, $Val extends TaxTotalsModel>
    implements $TaxTotalsModelCopyWith<$Res> {
  _$TaxTotalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountUntaxed = freezed,
    Object? amountTotal = freezed,
  }) {
    return _then(_value.copyWith(
      amountUntaxed: freezed == amountUntaxed
          ? _value.amountUntaxed
          : amountUntaxed // ignore: cast_nullable_to_non_nullable
              as double?,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxTotalsModelImplCopyWith<$Res>
    implements $TaxTotalsModelCopyWith<$Res> {
  factory _$$TaxTotalsModelImplCopyWith(_$TaxTotalsModelImpl value,
          $Res Function(_$TaxTotalsModelImpl) then) =
      __$$TaxTotalsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount_untaxed') double? amountUntaxed,
      @JsonKey(name: 'amount_total') double? amountTotal});
}

/// @nodoc
class __$$TaxTotalsModelImplCopyWithImpl<$Res>
    extends _$TaxTotalsModelCopyWithImpl<$Res, _$TaxTotalsModelImpl>
    implements _$$TaxTotalsModelImplCopyWith<$Res> {
  __$$TaxTotalsModelImplCopyWithImpl(
      _$TaxTotalsModelImpl _value, $Res Function(_$TaxTotalsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountUntaxed = freezed,
    Object? amountTotal = freezed,
  }) {
    return _then(_$TaxTotalsModelImpl(
      amountUntaxed: freezed == amountUntaxed
          ? _value.amountUntaxed
          : amountUntaxed // ignore: cast_nullable_to_non_nullable
              as double?,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxTotalsModelImpl implements _TaxTotalsModel {
  const _$TaxTotalsModelImpl(
      {@JsonKey(name: 'amount_untaxed') required this.amountUntaxed,
      @JsonKey(name: 'amount_total') required this.amountTotal});

  factory _$TaxTotalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxTotalsModelImplFromJson(json);

  @override
  @JsonKey(name: 'amount_untaxed')
  final double? amountUntaxed;
  @override
  @JsonKey(name: 'amount_total')
  final double? amountTotal;

  @override
  String toString() {
    return 'TaxTotalsModel(amountUntaxed: $amountUntaxed, amountTotal: $amountTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxTotalsModelImpl &&
            (identical(other.amountUntaxed, amountUntaxed) ||
                other.amountUntaxed == amountUntaxed) &&
            (identical(other.amountTotal, amountTotal) ||
                other.amountTotal == amountTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amountUntaxed, amountTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxTotalsModelImplCopyWith<_$TaxTotalsModelImpl> get copyWith =>
      __$$TaxTotalsModelImplCopyWithImpl<_$TaxTotalsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxTotalsModelImplToJson(
      this,
    );
  }
}

abstract class _TaxTotalsModel implements TaxTotalsModel {
  const factory _TaxTotalsModel(
      {@JsonKey(name: 'amount_untaxed') required final double? amountUntaxed,
      @JsonKey(name: 'amount_total')
      required final double? amountTotal}) = _$TaxTotalsModelImpl;

  factory _TaxTotalsModel.fromJson(Map<String, dynamic> json) =
      _$TaxTotalsModelImpl.fromJson;

  @override
  @JsonKey(name: 'amount_untaxed')
  double? get amountUntaxed;
  @override
  @JsonKey(name: 'amount_total')
  double? get amountTotal;
  @override
  @JsonKey(ignore: true)
  _$$TaxTotalsModelImplCopyWith<_$TaxTotalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
