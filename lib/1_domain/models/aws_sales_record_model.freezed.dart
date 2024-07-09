// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aws_sales_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AwsSalesOrder _$AwsSalesOrderFromJson(Map<String, dynamic> json) {
  return _AwsSalesOrder.fromJson(json);
}

/// @nodoc
mixin _$AwsSalesOrder {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError; //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate => throw _privateConstructorUsedError; //B
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError; //B
  @JsonKey(name: 'partner_id_display_name')
  String? get partnerIdDisplayName => throw _privateConstructorUsedError; //C
  @JsonKey(name: 'partner_id_contact_address')
  String? get partnerIdContactAddress => throw _privateConstructorUsedError; //D
  @JsonKey(name: 'partner_id_phone')
  dynamic get partnerIdPhone => throw _privateConstructorUsedError; //E
  @JsonKey(name: 'x_studio_sales_rep_1')
  String? get xStudioSalesRep1 => throw _privateConstructorUsedError; //F
  @JsonKey(name: 'x_studio_sales_source')
  String? get xStudioSalesSource => throw _privateConstructorUsedError; //G
  @JsonKey(name: 'x_studio_commission_paid')
  @IntToBooleanConverter()
  bool get xStudioCommissionPaid => throw _privateConstructorUsedError; //H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @JsonKey(name: 'x_studio_referrer_processed')
  @IntToBooleanConverter()
  bool get xStudioReferrerProcessed => throw _privateConstructorUsedError; //J,
  @JsonKey(name: 'x_studio_payment_type')
  String? get xStudioPaymentType => throw _privateConstructorUsedError; //K
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
  @JsonKey(name: 'amount_untaxed')
  double? get amountUntaxed => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_line')
  List<AwsOrderLine>? get orderLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_deduction')
  double? get additionalDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_by_manager')
  @IntToBooleanConverter()
  bool get confirmedByManager => throw _privateConstructorUsedError;
  AwsUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_deducted_by')
  int? get lastDeductedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_confirmed_by')
  int? get lastConfirmedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'manual_notes')
  String? get manualNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_deadline')
  DateTime? get dateDeadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwsSalesOrderCopyWith<AwsSalesOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsSalesOrderCopyWith<$Res> {
  factory $AwsSalesOrderCopyWith(
          AwsSalesOrder value, $Res Function(AwsSalesOrder) then) =
      _$AwsSalesOrderCopyWithImpl<$Res, AwsSalesOrder>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'partner_id_display_name') String? partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      String? partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') dynamic partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String? xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      @IntToBooleanConverter()
      bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      @IntToBooleanConverter()
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String? xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'amount_untaxed') double? amountUntaxed,
      @JsonKey(name: 'order_line') List<AwsOrderLine>? orderLine,
      @JsonKey(name: 'additional_deduction') double? additionalDeduction,
      @JsonKey(name: 'confirmed_by_manager')
      @IntToBooleanConverter()
      bool confirmedByManager,
      AwsUser? user,
      @JsonKey(name: 'last_deducted_by') int? lastDeductedBy,
      @JsonKey(name: 'last_confirmed_by') int? lastConfirmedBy,
      @JsonKey(name: 'manual_notes') String? manualNotes,
      @JsonKey(name: 'date_deadline') DateTime? dateDeadline});

  $AwsUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AwsSalesOrderCopyWithImpl<$Res, $Val extends AwsSalesOrder>
    implements $AwsSalesOrderCopyWith<$Res> {
  _$AwsSalesOrderCopyWithImpl(this._value, this._then);

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
    Object? updatedAt = freezed,
    Object? partnerIdDisplayName = freezed,
    Object? partnerIdContactAddress = freezed,
    Object? partnerIdPhone = freezed,
    Object? xStudioSalesRep1 = freezed,
    Object? xStudioSalesSource = freezed,
    Object? xStudioCommissionPaid = null,
    Object? xStudioReferrerProcessed = null,
    Object? xStudioPaymentType = freezed,
    Object? amountTotal = freezed,
    Object? deliveryStatus = freezed,
    Object? amountToInvoice = freezed,
    Object? xStudioInvoicePaymentStatus = freezed,
    Object? internalNoteDisplay = freezed,
    Object? state = freezed,
    Object? amountUntaxed = freezed,
    Object? orderLine = freezed,
    Object? additionalDeduction = freezed,
    Object? confirmedByManager = null,
    Object? user = freezed,
    Object? lastDeductedBy = freezed,
    Object? lastConfirmedBy = freezed,
    Object? manualNotes = freezed,
    Object? dateDeadline = freezed,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      partnerIdDisplayName: freezed == partnerIdDisplayName
          ? _value.partnerIdDisplayName
          : partnerIdDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerIdContactAddress: freezed == partnerIdContactAddress
          ? _value.partnerIdContactAddress
          : partnerIdContactAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerIdPhone: freezed == partnerIdPhone
          ? _value.partnerIdPhone
          : partnerIdPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      xStudioSalesRep1: freezed == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String?,
      xStudioSalesSource: freezed == xStudioSalesSource
          ? _value.xStudioSalesSource
          : xStudioSalesSource // ignore: cast_nullable_to_non_nullable
              as String?,
      xStudioCommissionPaid: null == xStudioCommissionPaid
          ? _value.xStudioCommissionPaid
          : xStudioCommissionPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioReferrerProcessed: null == xStudioReferrerProcessed
          ? _value.xStudioReferrerProcessed
          : xStudioReferrerProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioPaymentType: freezed == xStudioPaymentType
          ? _value.xStudioPaymentType
          : xStudioPaymentType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      amountUntaxed: freezed == amountUntaxed
          ? _value.amountUntaxed
          : amountUntaxed // ignore: cast_nullable_to_non_nullable
              as double?,
      orderLine: freezed == orderLine
          ? _value.orderLine
          : orderLine // ignore: cast_nullable_to_non_nullable
              as List<AwsOrderLine>?,
      additionalDeduction: freezed == additionalDeduction
          ? _value.additionalDeduction
          : additionalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      confirmedByManager: null == confirmedByManager
          ? _value.confirmedByManager
          : confirmedByManager // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AwsUser?,
      lastDeductedBy: freezed == lastDeductedBy
          ? _value.lastDeductedBy
          : lastDeductedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastConfirmedBy: freezed == lastConfirmedBy
          ? _value.lastConfirmedBy
          : lastConfirmedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      manualNotes: freezed == manualNotes
          ? _value.manualNotes
          : manualNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeadline: freezed == dateDeadline
          ? _value.dateDeadline
          : dateDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AwsUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AwsUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AwsSalesOrderImplCopyWith<$Res>
    implements $AwsSalesOrderCopyWith<$Res> {
  factory _$$AwsSalesOrderImplCopyWith(
          _$AwsSalesOrderImpl value, $Res Function(_$AwsSalesOrderImpl) then) =
      __$$AwsSalesOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'partner_id_display_name') String? partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      String? partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') dynamic partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String? xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      @IntToBooleanConverter()
      bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      @IntToBooleanConverter()
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String? xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'amount_untaxed') double? amountUntaxed,
      @JsonKey(name: 'order_line') List<AwsOrderLine>? orderLine,
      @JsonKey(name: 'additional_deduction') double? additionalDeduction,
      @JsonKey(name: 'confirmed_by_manager')
      @IntToBooleanConverter()
      bool confirmedByManager,
      AwsUser? user,
      @JsonKey(name: 'last_deducted_by') int? lastDeductedBy,
      @JsonKey(name: 'last_confirmed_by') int? lastConfirmedBy,
      @JsonKey(name: 'manual_notes') String? manualNotes,
      @JsonKey(name: 'date_deadline') DateTime? dateDeadline});

  @override
  $AwsUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AwsSalesOrderImplCopyWithImpl<$Res>
    extends _$AwsSalesOrderCopyWithImpl<$Res, _$AwsSalesOrderImpl>
    implements _$$AwsSalesOrderImplCopyWith<$Res> {
  __$$AwsSalesOrderImplCopyWithImpl(
      _$AwsSalesOrderImpl _value, $Res Function(_$AwsSalesOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
    Object? updatedAt = freezed,
    Object? partnerIdDisplayName = freezed,
    Object? partnerIdContactAddress = freezed,
    Object? partnerIdPhone = freezed,
    Object? xStudioSalesRep1 = freezed,
    Object? xStudioSalesSource = freezed,
    Object? xStudioCommissionPaid = null,
    Object? xStudioReferrerProcessed = null,
    Object? xStudioPaymentType = freezed,
    Object? amountTotal = freezed,
    Object? deliveryStatus = freezed,
    Object? amountToInvoice = freezed,
    Object? xStudioInvoicePaymentStatus = freezed,
    Object? internalNoteDisplay = freezed,
    Object? state = freezed,
    Object? amountUntaxed = freezed,
    Object? orderLine = freezed,
    Object? additionalDeduction = freezed,
    Object? confirmedByManager = null,
    Object? user = freezed,
    Object? lastDeductedBy = freezed,
    Object? lastConfirmedBy = freezed,
    Object? manualNotes = freezed,
    Object? dateDeadline = freezed,
  }) {
    return _then(_$AwsSalesOrderImpl(
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      partnerIdDisplayName: freezed == partnerIdDisplayName
          ? _value.partnerIdDisplayName
          : partnerIdDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerIdContactAddress: freezed == partnerIdContactAddress
          ? _value.partnerIdContactAddress
          : partnerIdContactAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerIdPhone: freezed == partnerIdPhone
          ? _value.partnerIdPhone
          : partnerIdPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      xStudioSalesRep1: freezed == xStudioSalesRep1
          ? _value.xStudioSalesRep1
          : xStudioSalesRep1 // ignore: cast_nullable_to_non_nullable
              as String?,
      xStudioSalesSource: freezed == xStudioSalesSource
          ? _value.xStudioSalesSource
          : xStudioSalesSource // ignore: cast_nullable_to_non_nullable
              as String?,
      xStudioCommissionPaid: null == xStudioCommissionPaid
          ? _value.xStudioCommissionPaid
          : xStudioCommissionPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioReferrerProcessed: null == xStudioReferrerProcessed
          ? _value.xStudioReferrerProcessed
          : xStudioReferrerProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      xStudioPaymentType: freezed == xStudioPaymentType
          ? _value.xStudioPaymentType
          : xStudioPaymentType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      amountUntaxed: freezed == amountUntaxed
          ? _value.amountUntaxed
          : amountUntaxed // ignore: cast_nullable_to_non_nullable
              as double?,
      orderLine: freezed == orderLine
          ? _value._orderLine
          : orderLine // ignore: cast_nullable_to_non_nullable
              as List<AwsOrderLine>?,
      additionalDeduction: freezed == additionalDeduction
          ? _value.additionalDeduction
          : additionalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      confirmedByManager: null == confirmedByManager
          ? _value.confirmedByManager
          : confirmedByManager // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AwsUser?,
      lastDeductedBy: freezed == lastDeductedBy
          ? _value.lastDeductedBy
          : lastDeductedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastConfirmedBy: freezed == lastConfirmedBy
          ? _value.lastConfirmedBy
          : lastConfirmedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      manualNotes: freezed == manualNotes
          ? _value.manualNotes
          : manualNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      dateDeadline: freezed == dateDeadline
          ? _value.dateDeadline
          : dateDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsSalesOrderImpl implements _AwsSalesOrder {
  const _$AwsSalesOrderImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'create_date') required this.createDate,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'partner_id_display_name')
      required this.partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      required this.partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') required this.partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') required this.xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') required this.xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      @IntToBooleanConverter()
      required this.xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      @IntToBooleanConverter()
      required this.xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') required this.xStudioPaymentType,
      @JsonKey(name: 'amount_total') required this.amountTotal,
      @JsonKey(name: 'delivery_status') required this.deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') required this.amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      required this.xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') required this.internalNoteDisplay,
      required this.state,
      @JsonKey(name: 'amount_untaxed') required this.amountUntaxed,
      @JsonKey(name: 'order_line') required final List<AwsOrderLine>? orderLine,
      @JsonKey(name: 'additional_deduction') required this.additionalDeduction,
      @JsonKey(name: 'confirmed_by_manager')
      @IntToBooleanConverter()
      required this.confirmedByManager,
      required this.user,
      @JsonKey(name: 'last_deducted_by') required this.lastDeductedBy,
      @JsonKey(name: 'last_confirmed_by') required this.lastConfirmedBy,
      @JsonKey(name: 'manual_notes') required this.manualNotes,
      @JsonKey(name: 'date_deadline') required this.dateDeadline})
      : _orderLine = orderLine;

  factory _$AwsSalesOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsSalesOrderImplFromJson(json);

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
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
//B
  @override
  @JsonKey(name: 'partner_id_display_name')
  final String? partnerIdDisplayName;
//C
  @override
  @JsonKey(name: 'partner_id_contact_address')
  final String? partnerIdContactAddress;
//D
  @override
  @JsonKey(name: 'partner_id_phone')
  final dynamic partnerIdPhone;
//E
  @override
  @JsonKey(name: 'x_studio_sales_rep_1')
  final String? xStudioSalesRep1;
//F
  @override
  @JsonKey(name: 'x_studio_sales_source')
  final String? xStudioSalesSource;
//G
  @override
  @JsonKey(name: 'x_studio_commission_paid')
  @IntToBooleanConverter()
  final bool xStudioCommissionPaid;
//H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @override
  @JsonKey(name: 'x_studio_referrer_processed')
  @IntToBooleanConverter()
  final bool xStudioReferrerProcessed;
//J,
  @override
  @JsonKey(name: 'x_studio_payment_type')
  final String? xStudioPaymentType;
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
  @JsonKey(name: 'amount_untaxed')
  final double? amountUntaxed;
  final List<AwsOrderLine>? _orderLine;
  @override
  @JsonKey(name: 'order_line')
  List<AwsOrderLine>? get orderLine {
    final value = _orderLine;
    if (value == null) return null;
    if (_orderLine is EqualUnmodifiableListView) return _orderLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'additional_deduction')
  final double? additionalDeduction;
  @override
  @JsonKey(name: 'confirmed_by_manager')
  @IntToBooleanConverter()
  final bool confirmedByManager;
  @override
  final AwsUser? user;
  @override
  @JsonKey(name: 'last_deducted_by')
  final int? lastDeductedBy;
  @override
  @JsonKey(name: 'last_confirmed_by')
  final int? lastConfirmedBy;
  @override
  @JsonKey(name: 'manual_notes')
  final String? manualNotes;
  @override
  @JsonKey(name: 'date_deadline')
  final DateTime? dateDeadline;

  @override
  String toString() {
    return 'AwsSalesOrder(id: $id, name: $name, createDate: $createDate, updatedAt: $updatedAt, partnerIdDisplayName: $partnerIdDisplayName, partnerIdContactAddress: $partnerIdContactAddress, partnerIdPhone: $partnerIdPhone, xStudioSalesRep1: $xStudioSalesRep1, xStudioSalesSource: $xStudioSalesSource, xStudioCommissionPaid: $xStudioCommissionPaid, xStudioReferrerProcessed: $xStudioReferrerProcessed, xStudioPaymentType: $xStudioPaymentType, amountTotal: $amountTotal, deliveryStatus: $deliveryStatus, amountToInvoice: $amountToInvoice, xStudioInvoicePaymentStatus: $xStudioInvoicePaymentStatus, internalNoteDisplay: $internalNoteDisplay, state: $state, amountUntaxed: $amountUntaxed, orderLine: $orderLine, additionalDeduction: $additionalDeduction, confirmedByManager: $confirmedByManager, user: $user, lastDeductedBy: $lastDeductedBy, lastConfirmedBy: $lastConfirmedBy, manualNotes: $manualNotes, dateDeadline: $dateDeadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsSalesOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.partnerIdDisplayName, partnerIdDisplayName) ||
                other.partnerIdDisplayName == partnerIdDisplayName) &&
            (identical(
                    other.partnerIdContactAddress, partnerIdContactAddress) ||
                other.partnerIdContactAddress == partnerIdContactAddress) &&
            const DeepCollectionEquality()
                .equals(other.partnerIdPhone, partnerIdPhone) &&
            (identical(other.xStudioSalesRep1, xStudioSalesRep1) ||
                other.xStudioSalesRep1 == xStudioSalesRep1) &&
            (identical(other.xStudioSalesSource, xStudioSalesSource) ||
                other.xStudioSalesSource == xStudioSalesSource) &&
            (identical(other.xStudioCommissionPaid, xStudioCommissionPaid) ||
                other.xStudioCommissionPaid == xStudioCommissionPaid) &&
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
            (identical(other.amountUntaxed, amountUntaxed) ||
                other.amountUntaxed == amountUntaxed) &&
            const DeepCollectionEquality()
                .equals(other._orderLine, _orderLine) &&
            (identical(other.additionalDeduction, additionalDeduction) ||
                other.additionalDeduction == additionalDeduction) &&
            (identical(other.confirmedByManager, confirmedByManager) ||
                other.confirmedByManager == confirmedByManager) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lastDeductedBy, lastDeductedBy) ||
                other.lastDeductedBy == lastDeductedBy) &&
            (identical(other.lastConfirmedBy, lastConfirmedBy) ||
                other.lastConfirmedBy == lastConfirmedBy) &&
            (identical(other.manualNotes, manualNotes) ||
                other.manualNotes == manualNotes) &&
            (identical(other.dateDeadline, dateDeadline) ||
                other.dateDeadline == dateDeadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        createDate,
        updatedAt,
        partnerIdDisplayName,
        partnerIdContactAddress,
        const DeepCollectionEquality().hash(partnerIdPhone),
        xStudioSalesRep1,
        xStudioSalesSource,
        xStudioCommissionPaid,
        xStudioReferrerProcessed,
        xStudioPaymentType,
        amountTotal,
        const DeepCollectionEquality().hash(deliveryStatus),
        amountToInvoice,
        const DeepCollectionEquality().hash(xStudioInvoicePaymentStatus),
        internalNoteDisplay,
        state,
        amountUntaxed,
        const DeepCollectionEquality().hash(_orderLine),
        additionalDeduction,
        confirmedByManager,
        user,
        lastDeductedBy,
        lastConfirmedBy,
        manualNotes,
        dateDeadline
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsSalesOrderImplCopyWith<_$AwsSalesOrderImpl> get copyWith =>
      __$$AwsSalesOrderImplCopyWithImpl<_$AwsSalesOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsSalesOrderImplToJson(
      this,
    );
  }
}

abstract class _AwsSalesOrder implements AwsSalesOrder {
  const factory _AwsSalesOrder(
      {required final int? id,
      required final String? name,
      @JsonKey(name: 'create_date') required final DateTime? createDate,
      @JsonKey(name: 'updated_at') required final DateTime? updatedAt,
      @JsonKey(name: 'partner_id_display_name')
      required final String? partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      required final String? partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') required final dynamic partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1')
      required final String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source')
      required final String? xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      @IntToBooleanConverter()
      required final bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      @IntToBooleanConverter()
      required final bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type')
      required final String? xStudioPaymentType,
      @JsonKey(name: 'amount_total') required final double? amountTotal,
      @JsonKey(name: 'delivery_status') required final dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice')
      required final double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      required final dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display')
      required final String? internalNoteDisplay,
      required final String? state,
      @JsonKey(name: 'amount_untaxed') required final double? amountUntaxed,
      @JsonKey(name: 'order_line') required final List<AwsOrderLine>? orderLine,
      @JsonKey(name: 'additional_deduction')
      required final double? additionalDeduction,
      @JsonKey(name: 'confirmed_by_manager')
      @IntToBooleanConverter()
      required final bool confirmedByManager,
      required final AwsUser? user,
      @JsonKey(name: 'last_deducted_by') required final int? lastDeductedBy,
      @JsonKey(name: 'last_confirmed_by') required final int? lastConfirmedBy,
      @JsonKey(name: 'manual_notes') required final String? manualNotes,
      @JsonKey(name: 'date_deadline')
      required final DateTime? dateDeadline}) = _$AwsSalesOrderImpl;

  factory _AwsSalesOrder.fromJson(Map<String, dynamic> json) =
      _$AwsSalesOrderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate;
  @override //B
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override //B
  @JsonKey(name: 'partner_id_display_name')
  String? get partnerIdDisplayName;
  @override //C
  @JsonKey(name: 'partner_id_contact_address')
  String? get partnerIdContactAddress;
  @override //D
  @JsonKey(name: 'partner_id_phone')
  dynamic get partnerIdPhone;
  @override //E
  @JsonKey(name: 'x_studio_sales_rep_1')
  String? get xStudioSalesRep1;
  @override //F
  @JsonKey(name: 'x_studio_sales_source')
  String? get xStudioSalesSource;
  @override //G
  @JsonKey(name: 'x_studio_commission_paid')
  @IntToBooleanConverter()
  bool get xStudioCommissionPaid;
  @override //H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @JsonKey(name: 'x_studio_referrer_processed')
  @IntToBooleanConverter()
  bool get xStudioReferrerProcessed;
  @override //J,
  @JsonKey(name: 'x_studio_payment_type')
  String? get xStudioPaymentType;
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
  @JsonKey(name: 'amount_untaxed')
  double? get amountUntaxed;
  @override
  @JsonKey(name: 'order_line')
  List<AwsOrderLine>? get orderLine;
  @override
  @JsonKey(name: 'additional_deduction')
  double? get additionalDeduction;
  @override
  @JsonKey(name: 'confirmed_by_manager')
  @IntToBooleanConverter()
  bool get confirmedByManager;
  @override
  AwsUser? get user;
  @override
  @JsonKey(name: 'last_deducted_by')
  int? get lastDeductedBy;
  @override
  @JsonKey(name: 'last_confirmed_by')
  int? get lastConfirmedBy;
  @override
  @JsonKey(name: 'manual_notes')
  String? get manualNotes;
  @override
  @JsonKey(name: 'date_deadline')
  DateTime? get dateDeadline;
  @override
  @JsonKey(ignore: true)
  _$$AwsSalesOrderImplCopyWith<_$AwsSalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AwsOrderLine _$AwsOrderLineFromJson(Map<String, dynamic> json) {
  return _AwsOrderLine.fromJson(json);
}

/// @nodoc
mixin _$AwsOrderLine {
  int? get id => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  num? get quantity => throw _privateConstructorUsedError;
  num? get delivered => throw _privateConstructorUsedError;
  num? get invoiced => throw _privateConstructorUsedError;
  @JsonKey(name: 'x_studio_invoice_payment_status')
  num? get unitPrice => throw _privateConstructorUsedError;
  String? get taxes => throw _privateConstructorUsedError;
  num? get disc => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_excl')
  num? get taxExcl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwsOrderLineCopyWith<AwsOrderLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsOrderLineCopyWith<$Res> {
  factory $AwsOrderLineCopyWith(
          AwsOrderLine value, $Res Function(AwsOrderLine) then) =
      _$AwsOrderLineCopyWithImpl<$Res, AwsOrderLine>;
  @useResult
  $Res call(
      {int? id,
      String? product,
      String? description,
      num? quantity,
      num? delivered,
      num? invoiced,
      @JsonKey(name: 'x_studio_invoice_payment_status') num? unitPrice,
      String? taxes,
      num? disc,
      @JsonKey(name: 'tax_excl') num? taxExcl});
}

/// @nodoc
class _$AwsOrderLineCopyWithImpl<$Res, $Val extends AwsOrderLine>
    implements $AwsOrderLineCopyWith<$Res> {
  _$AwsOrderLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? delivered = freezed,
    Object? invoiced = freezed,
    Object? unitPrice = freezed,
    Object? taxes = freezed,
    Object? disc = freezed,
    Object? taxExcl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as num?,
      invoiced: freezed == invoiced
          ? _value.invoiced
          : invoiced // ignore: cast_nullable_to_non_nullable
              as num?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      taxes: freezed == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as String?,
      disc: freezed == disc
          ? _value.disc
          : disc // ignore: cast_nullable_to_non_nullable
              as num?,
      taxExcl: freezed == taxExcl
          ? _value.taxExcl
          : taxExcl // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwsOrderLineImplCopyWith<$Res>
    implements $AwsOrderLineCopyWith<$Res> {
  factory _$$AwsOrderLineImplCopyWith(
          _$AwsOrderLineImpl value, $Res Function(_$AwsOrderLineImpl) then) =
      __$$AwsOrderLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? product,
      String? description,
      num? quantity,
      num? delivered,
      num? invoiced,
      @JsonKey(name: 'x_studio_invoice_payment_status') num? unitPrice,
      String? taxes,
      num? disc,
      @JsonKey(name: 'tax_excl') num? taxExcl});
}

/// @nodoc
class __$$AwsOrderLineImplCopyWithImpl<$Res>
    extends _$AwsOrderLineCopyWithImpl<$Res, _$AwsOrderLineImpl>
    implements _$$AwsOrderLineImplCopyWith<$Res> {
  __$$AwsOrderLineImplCopyWithImpl(
      _$AwsOrderLineImpl _value, $Res Function(_$AwsOrderLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? delivered = freezed,
    Object? invoiced = freezed,
    Object? unitPrice = freezed,
    Object? taxes = freezed,
    Object? disc = freezed,
    Object? taxExcl = freezed,
  }) {
    return _then(_$AwsOrderLineImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as num?,
      invoiced: freezed == invoiced
          ? _value.invoiced
          : invoiced // ignore: cast_nullable_to_non_nullable
              as num?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      taxes: freezed == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as String?,
      disc: freezed == disc
          ? _value.disc
          : disc // ignore: cast_nullable_to_non_nullable
              as num?,
      taxExcl: freezed == taxExcl
          ? _value.taxExcl
          : taxExcl // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsOrderLineImpl implements _AwsOrderLine {
  const _$AwsOrderLineImpl(
      {required this.id,
      required this.product,
      required this.description,
      required this.quantity,
      required this.delivered,
      required this.invoiced,
      @JsonKey(name: 'x_studio_invoice_payment_status') required this.unitPrice,
      required this.taxes,
      required this.disc,
      @JsonKey(name: 'tax_excl') required this.taxExcl});

  factory _$AwsOrderLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsOrderLineImplFromJson(json);

  @override
  final int? id;
  @override
  final String? product;
  @override
  final String? description;
  @override
  final num? quantity;
  @override
  final num? delivered;
  @override
  final num? invoiced;
  @override
  @JsonKey(name: 'x_studio_invoice_payment_status')
  final num? unitPrice;
  @override
  final String? taxes;
  @override
  final num? disc;
  @override
  @JsonKey(name: 'tax_excl')
  final num? taxExcl;

  @override
  String toString() {
    return 'AwsOrderLine(id: $id, product: $product, description: $description, quantity: $quantity, delivered: $delivered, invoiced: $invoiced, unitPrice: $unitPrice, taxes: $taxes, disc: $disc, taxExcl: $taxExcl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsOrderLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.invoiced, invoiced) ||
                other.invoiced == invoiced) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.taxes, taxes) || other.taxes == taxes) &&
            (identical(other.disc, disc) || other.disc == disc) &&
            (identical(other.taxExcl, taxExcl) || other.taxExcl == taxExcl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, description,
      quantity, delivered, invoiced, unitPrice, taxes, disc, taxExcl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsOrderLineImplCopyWith<_$AwsOrderLineImpl> get copyWith =>
      __$$AwsOrderLineImplCopyWithImpl<_$AwsOrderLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsOrderLineImplToJson(
      this,
    );
  }
}

abstract class _AwsOrderLine implements AwsOrderLine {
  const factory _AwsOrderLine(
          {required final int? id,
          required final String? product,
          required final String? description,
          required final num? quantity,
          required final num? delivered,
          required final num? invoiced,
          @JsonKey(name: 'x_studio_invoice_payment_status')
          required final num? unitPrice,
          required final String? taxes,
          required final num? disc,
          @JsonKey(name: 'tax_excl') required final num? taxExcl}) =
      _$AwsOrderLineImpl;

  factory _AwsOrderLine.fromJson(Map<String, dynamic> json) =
      _$AwsOrderLineImpl.fromJson;

  @override
  int? get id;
  @override
  String? get product;
  @override
  String? get description;
  @override
  num? get quantity;
  @override
  num? get delivered;
  @override
  num? get invoiced;
  @override
  @JsonKey(name: 'x_studio_invoice_payment_status')
  num? get unitPrice;
  @override
  String? get taxes;
  @override
  num? get disc;
  @override
  @JsonKey(name: 'tax_excl')
  num? get taxExcl;
  @override
  @JsonKey(ignore: true)
  _$$AwsOrderLineImplCopyWith<_$AwsOrderLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
