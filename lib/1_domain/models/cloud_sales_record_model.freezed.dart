// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_sales_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CloudSalesOrder _$CloudSalesOrderFromJson(Map<String, dynamic> json) {
  return _CloudSalesOrder.fromJson(json);
}

/// @nodoc
mixin _$CloudSalesOrder {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError; //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate => throw _privateConstructorUsedError; //B
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
  bool get xStudioCommissionPaid => throw _privateConstructorUsedError; //H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @JsonKey(name: 'x_studio_referrer_processed')
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudSalesOrderCopyWith<CloudSalesOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudSalesOrderCopyWith<$Res> {
  factory $CloudSalesOrderCopyWith(
          CloudSalesOrder value, $Res Function(CloudSalesOrder) then) =
      _$CloudSalesOrderCopyWithImpl<$Res, CloudSalesOrder>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'partner_id_display_name') String? partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      String? partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') dynamic partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String? xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String? xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'amount_untaxed') double? amountUntaxed});
}

/// @nodoc
class _$CloudSalesOrderCopyWithImpl<$Res, $Val extends CloudSalesOrder>
    implements $CloudSalesOrderCopyWith<$Res> {
  _$CloudSalesOrderCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudSalesOrderImplCopyWith<$Res>
    implements $CloudSalesOrderCopyWith<$Res> {
  factory _$$CloudSalesOrderImplCopyWith(_$CloudSalesOrderImpl value,
          $Res Function(_$CloudSalesOrderImpl) then) =
      __$$CloudSalesOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'create_date') DateTime? createDate,
      @JsonKey(name: 'partner_id_display_name') String? partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      String? partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') dynamic partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') String? xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') String? xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid') bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
      bool xStudioReferrerProcessed,
      @JsonKey(name: 'x_studio_payment_type') String? xStudioPaymentType,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'delivery_status') dynamic deliveryStatus,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'x_studio_invoice_payment_status')
      dynamic xStudioInvoicePaymentStatus,
      @JsonKey(name: 'internal_note_display') String? internalNoteDisplay,
      String? state,
      @JsonKey(name: 'amount_untaxed') double? amountUntaxed});
}

/// @nodoc
class __$$CloudSalesOrderImplCopyWithImpl<$Res>
    extends _$CloudSalesOrderCopyWithImpl<$Res, _$CloudSalesOrderImpl>
    implements _$$CloudSalesOrderImplCopyWith<$Res> {
  __$$CloudSalesOrderImplCopyWithImpl(
      _$CloudSalesOrderImpl _value, $Res Function(_$CloudSalesOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
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
  }) {
    return _then(_$CloudSalesOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudSalesOrderImpl implements _CloudSalesOrder {
  const _$CloudSalesOrderImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'create_date') required this.createDate,
      @JsonKey(name: 'partner_id_display_name')
      required this.partnerIdDisplayName,
      @JsonKey(name: 'partner_id_contact_address')
      required this.partnerIdContactAddress,
      @JsonKey(name: 'partner_id_phone') required this.partnerIdPhone,
      @JsonKey(name: 'x_studio_sales_rep_1') required this.xStudioSalesRep1,
      @JsonKey(name: 'x_studio_sales_source') required this.xStudioSalesSource,
      @JsonKey(name: 'x_studio_commission_paid')
      required this.xStudioCommissionPaid,
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
      @JsonKey(name: 'amount_untaxed') required this.amountUntaxed});

  factory _$CloudSalesOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudSalesOrderImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
//A
  @override
  @JsonKey(name: 'create_date')
  final DateTime? createDate;
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
  final bool xStudioCommissionPaid;
//H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @override
  @JsonKey(name: 'x_studio_referrer_processed')
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

  @override
  String toString() {
    return 'CloudSalesOrder(id: $id, name: $name, createDate: $createDate, partnerIdDisplayName: $partnerIdDisplayName, partnerIdContactAddress: $partnerIdContactAddress, partnerIdPhone: $partnerIdPhone, xStudioSalesRep1: $xStudioSalesRep1, xStudioSalesSource: $xStudioSalesSource, xStudioCommissionPaid: $xStudioCommissionPaid, xStudioReferrerProcessed: $xStudioReferrerProcessed, xStudioPaymentType: $xStudioPaymentType, amountTotal: $amountTotal, deliveryStatus: $deliveryStatus, amountToInvoice: $amountToInvoice, xStudioInvoicePaymentStatus: $xStudioInvoicePaymentStatus, internalNoteDisplay: $internalNoteDisplay, state: $state, amountUntaxed: $amountUntaxed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudSalesOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
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
                other.amountUntaxed == amountUntaxed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createDate,
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
      amountUntaxed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudSalesOrderImplCopyWith<_$CloudSalesOrderImpl> get copyWith =>
      __$$CloudSalesOrderImplCopyWithImpl<_$CloudSalesOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudSalesOrderImplToJson(
      this,
    );
  }
}

abstract class _CloudSalesOrder implements CloudSalesOrder {
  const factory _CloudSalesOrder(
      {required final String? id,
      required final String? name,
      @JsonKey(name: 'create_date') required final DateTime? createDate,
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
      required final bool xStudioCommissionPaid,
      @JsonKey(name: 'x_studio_referrer_processed')
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
      @JsonKey(name: 'amount_untaxed')
      required final double? amountUntaxed}) = _$CloudSalesOrderImpl;

  factory _CloudSalesOrder.fromJson(Map<String, dynamic> json) =
      _$CloudSalesOrderImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override //A
  @JsonKey(name: 'create_date')
  DateTime? get createDate;
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
  bool get xStudioCommissionPaid;
  @override //H,
// @JsonKey(name: 'x_studio_referred_by')
// required ReferredByModel? xStudioReferredBy,
  @JsonKey(name: 'x_studio_referrer_processed')
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
  @JsonKey(ignore: true)
  _$$CloudSalesOrderImplCopyWith<_$CloudSalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CloudOrderLines _$CloudOrderLinesFromJson(Map<String, dynamic> json) {
  return _CloudOrderLines.fromJson(json);
}

/// @nodoc
mixin _$CloudOrderLines {
  String? get product => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  num? get quantity => throw _privateConstructorUsedError;
  num? get delivered => throw _privateConstructorUsedError;
  num? get invoiced => throw _privateConstructorUsedError;
  num? get unitPrice => throw _privateConstructorUsedError;
  String? get taxes => throw _privateConstructorUsedError;
  num? get disc => throw _privateConstructorUsedError;
  num? get taxExcl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudOrderLinesCopyWith<CloudOrderLines> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudOrderLinesCopyWith<$Res> {
  factory $CloudOrderLinesCopyWith(
          CloudOrderLines value, $Res Function(CloudOrderLines) then) =
      _$CloudOrderLinesCopyWithImpl<$Res, CloudOrderLines>;
  @useResult
  $Res call(
      {String? product,
      String? description,
      num? quantity,
      num? delivered,
      num? invoiced,
      num? unitPrice,
      String? taxes,
      num? disc,
      num? taxExcl});
}

/// @nodoc
class _$CloudOrderLinesCopyWithImpl<$Res, $Val extends CloudOrderLines>
    implements $CloudOrderLinesCopyWith<$Res> {
  _$CloudOrderLinesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
abstract class _$$CloudOrderLinesImplCopyWith<$Res>
    implements $CloudOrderLinesCopyWith<$Res> {
  factory _$$CloudOrderLinesImplCopyWith(_$CloudOrderLinesImpl value,
          $Res Function(_$CloudOrderLinesImpl) then) =
      __$$CloudOrderLinesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? product,
      String? description,
      num? quantity,
      num? delivered,
      num? invoiced,
      num? unitPrice,
      String? taxes,
      num? disc,
      num? taxExcl});
}

/// @nodoc
class __$$CloudOrderLinesImplCopyWithImpl<$Res>
    extends _$CloudOrderLinesCopyWithImpl<$Res, _$CloudOrderLinesImpl>
    implements _$$CloudOrderLinesImplCopyWith<$Res> {
  __$$CloudOrderLinesImplCopyWithImpl(
      _$CloudOrderLinesImpl _value, $Res Function(_$CloudOrderLinesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    return _then(_$CloudOrderLinesImpl(
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
class _$CloudOrderLinesImpl implements _CloudOrderLines {
  const _$CloudOrderLinesImpl(
      {required this.product,
      required this.description,
      required this.quantity,
      required this.delivered,
      required this.invoiced,
      required this.unitPrice,
      required this.taxes,
      required this.disc,
      required this.taxExcl});

  factory _$CloudOrderLinesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudOrderLinesImplFromJson(json);

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
  final num? unitPrice;
  @override
  final String? taxes;
  @override
  final num? disc;
  @override
  final num? taxExcl;

  @override
  String toString() {
    return 'CloudOrderLines(product: $product, description: $description, quantity: $quantity, delivered: $delivered, invoiced: $invoiced, unitPrice: $unitPrice, taxes: $taxes, disc: $disc, taxExcl: $taxExcl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudOrderLinesImpl &&
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
  int get hashCode => Object.hash(runtimeType, product, description, quantity,
      delivered, invoiced, unitPrice, taxes, disc, taxExcl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudOrderLinesImplCopyWith<_$CloudOrderLinesImpl> get copyWith =>
      __$$CloudOrderLinesImplCopyWithImpl<_$CloudOrderLinesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudOrderLinesImplToJson(
      this,
    );
  }
}

abstract class _CloudOrderLines implements CloudOrderLines {
  const factory _CloudOrderLines(
      {required final String? product,
      required final String? description,
      required final num? quantity,
      required final num? delivered,
      required final num? invoiced,
      required final num? unitPrice,
      required final String? taxes,
      required final num? disc,
      required final num? taxExcl}) = _$CloudOrderLinesImpl;

  factory _CloudOrderLines.fromJson(Map<String, dynamic> json) =
      _$CloudOrderLinesImpl.fromJson;

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
  num? get unitPrice;
  @override
  String? get taxes;
  @override
  num? get disc;
  @override
  num? get taxExcl;
  @override
  @JsonKey(ignore: true)
  _$$CloudOrderLinesImplCopyWith<_$CloudOrderLinesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
