// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qoutation_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuotationRecord _$QuotationRecordFromJson(Map<String, dynamic> json) {
  return _QuotationRecord.fromJson(json);
}

/// @nodoc
mixin _$QuotationRecord {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_id')
  IdModel? get partnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_total')
  double? get amountTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_to_invoice')
  double? get amountToInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_order')
  DateTime? get dateOrder => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  IdModel? get currencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_state')
  dynamic get activityState => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_ids')
  List<ActivityIdModel>? get activityIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_exception_decoration')
  bool get activityExceptionDecoration => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_exception_icon')
  bool get activityExceptionIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_summary')
  dynamic get activitySummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_type_icon')
  dynamic get activityTypeIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_type_id')
  dynamic get activityTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotationRecordCopyWith<QuotationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationRecordCopyWith<$Res> {
  factory $QuotationRecordCopyWith(
          QuotationRecord value, $Res Function(QuotationRecord) then) =
      _$QuotationRecordCopyWithImpl<$Res, QuotationRecord>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'partner_id') IdModel? partnerId,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'date_order') DateTime? dateOrder,
      String? state,
      @JsonKey(name: 'currency_id') IdModel? currencyId,
      @JsonKey(name: 'activity_state') dynamic activityState,
      @JsonKey(name: 'activity_ids') List<ActivityIdModel>? activityIds,
      @JsonKey(name: 'activity_exception_decoration')
      bool activityExceptionDecoration,
      @JsonKey(name: 'activity_exception_icon') bool activityExceptionIcon,
      @JsonKey(name: 'activity_summary') dynamic activitySummary,
      @JsonKey(name: 'activity_type_icon') dynamic activityTypeIcon,
      @JsonKey(name: 'activity_type_id') dynamic activityTypeId});

  $IdModelCopyWith<$Res>? get partnerId;
  $IdModelCopyWith<$Res>? get currencyId;
}

/// @nodoc
class _$QuotationRecordCopyWithImpl<$Res, $Val extends QuotationRecord>
    implements $QuotationRecordCopyWith<$Res> {
  _$QuotationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? partnerId = freezed,
    Object? amountTotal = freezed,
    Object? amountToInvoice = freezed,
    Object? dateOrder = freezed,
    Object? state = freezed,
    Object? currencyId = freezed,
    Object? activityState = freezed,
    Object? activityIds = freezed,
    Object? activityExceptionDecoration = null,
    Object? activityExceptionIcon = null,
    Object? activitySummary = freezed,
    Object? activityTypeIcon = freezed,
    Object? activityTypeId = freezed,
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
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as IdModel?,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      amountToInvoice: freezed == amountToInvoice
          ? _value.amountToInvoice
          : amountToInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as IdModel?,
      activityState: freezed == activityState
          ? _value.activityState
          : activityState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityIds: freezed == activityIds
          ? _value.activityIds
          : activityIds // ignore: cast_nullable_to_non_nullable
              as List<ActivityIdModel>?,
      activityExceptionDecoration: null == activityExceptionDecoration
          ? _value.activityExceptionDecoration
          : activityExceptionDecoration // ignore: cast_nullable_to_non_nullable
              as bool,
      activityExceptionIcon: null == activityExceptionIcon
          ? _value.activityExceptionIcon
          : activityExceptionIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      activitySummary: freezed == activitySummary
          ? _value.activitySummary
          : activitySummary // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityTypeIcon: freezed == activityTypeIcon
          ? _value.activityTypeIcon
          : activityTypeIcon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityTypeId: freezed == activityTypeId
          ? _value.activityTypeId
          : activityTypeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdModelCopyWith<$Res>? get partnerId {
    if (_value.partnerId == null) {
      return null;
    }

    return $IdModelCopyWith<$Res>(_value.partnerId!, (value) {
      return _then(_value.copyWith(partnerId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IdModelCopyWith<$Res>? get currencyId {
    if (_value.currencyId == null) {
      return null;
    }

    return $IdModelCopyWith<$Res>(_value.currencyId!, (value) {
      return _then(_value.copyWith(currencyId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuotationRecordImplCopyWith<$Res>
    implements $QuotationRecordCopyWith<$Res> {
  factory _$$QuotationRecordImplCopyWith(_$QuotationRecordImpl value,
          $Res Function(_$QuotationRecordImpl) then) =
      __$$QuotationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'partner_id') IdModel? partnerId,
      @JsonKey(name: 'amount_total') double? amountTotal,
      @JsonKey(name: 'amount_to_invoice') double? amountToInvoice,
      @JsonKey(name: 'date_order') DateTime? dateOrder,
      String? state,
      @JsonKey(name: 'currency_id') IdModel? currencyId,
      @JsonKey(name: 'activity_state') dynamic activityState,
      @JsonKey(name: 'activity_ids') List<ActivityIdModel>? activityIds,
      @JsonKey(name: 'activity_exception_decoration')
      bool activityExceptionDecoration,
      @JsonKey(name: 'activity_exception_icon') bool activityExceptionIcon,
      @JsonKey(name: 'activity_summary') dynamic activitySummary,
      @JsonKey(name: 'activity_type_icon') dynamic activityTypeIcon,
      @JsonKey(name: 'activity_type_id') dynamic activityTypeId});

  @override
  $IdModelCopyWith<$Res>? get partnerId;
  @override
  $IdModelCopyWith<$Res>? get currencyId;
}

/// @nodoc
class __$$QuotationRecordImplCopyWithImpl<$Res>
    extends _$QuotationRecordCopyWithImpl<$Res, _$QuotationRecordImpl>
    implements _$$QuotationRecordImplCopyWith<$Res> {
  __$$QuotationRecordImplCopyWithImpl(
      _$QuotationRecordImpl _value, $Res Function(_$QuotationRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? partnerId = freezed,
    Object? amountTotal = freezed,
    Object? amountToInvoice = freezed,
    Object? dateOrder = freezed,
    Object? state = freezed,
    Object? currencyId = freezed,
    Object? activityState = freezed,
    Object? activityIds = freezed,
    Object? activityExceptionDecoration = null,
    Object? activityExceptionIcon = null,
    Object? activitySummary = freezed,
    Object? activityTypeIcon = freezed,
    Object? activityTypeId = freezed,
  }) {
    return _then(_$QuotationRecordImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as IdModel?,
      amountTotal: freezed == amountTotal
          ? _value.amountTotal
          : amountTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      amountToInvoice: freezed == amountToInvoice
          ? _value.amountToInvoice
          : amountToInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      dateOrder: freezed == dateOrder
          ? _value.dateOrder
          : dateOrder // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as IdModel?,
      activityState: freezed == activityState
          ? _value.activityState
          : activityState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityIds: freezed == activityIds
          ? _value._activityIds
          : activityIds // ignore: cast_nullable_to_non_nullable
              as List<ActivityIdModel>?,
      activityExceptionDecoration: null == activityExceptionDecoration
          ? _value.activityExceptionDecoration
          : activityExceptionDecoration // ignore: cast_nullable_to_non_nullable
              as bool,
      activityExceptionIcon: null == activityExceptionIcon
          ? _value.activityExceptionIcon
          : activityExceptionIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      activitySummary: freezed == activitySummary
          ? _value.activitySummary
          : activitySummary // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityTypeIcon: freezed == activityTypeIcon
          ? _value.activityTypeIcon
          : activityTypeIcon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityTypeId: freezed == activityTypeId
          ? _value.activityTypeId
          : activityTypeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotationRecordImpl implements _QuotationRecord {
  const _$QuotationRecordImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'partner_id') required this.partnerId,
      @JsonKey(name: 'amount_total') required this.amountTotal,
      @JsonKey(name: 'amount_to_invoice') required this.amountToInvoice,
      @JsonKey(name: 'date_order') required this.dateOrder,
      required this.state,
      @JsonKey(name: 'currency_id') required this.currencyId,
      @JsonKey(name: 'activity_state') this.activityState,
      @JsonKey(name: 'activity_ids')
      required final List<ActivityIdModel>? activityIds,
      @JsonKey(name: 'activity_exception_decoration')
      this.activityExceptionDecoration = false,
      @JsonKey(name: 'activity_exception_icon')
      this.activityExceptionIcon = false,
      @JsonKey(name: 'activity_summary') this.activitySummary,
      @JsonKey(name: 'activity_type_icon') this.activityTypeIcon,
      @JsonKey(name: 'activity_type_id') this.activityTypeId})
      : _activityIds = activityIds;

  factory _$QuotationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotationRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'partner_id')
  final IdModel? partnerId;
  @override
  @JsonKey(name: 'amount_total')
  final double? amountTotal;
  @override
  @JsonKey(name: 'amount_to_invoice')
  final double? amountToInvoice;
  @override
  @JsonKey(name: 'date_order')
  final DateTime? dateOrder;
  @override
  final String? state;
  @override
  @JsonKey(name: 'currency_id')
  final IdModel? currencyId;
  @override
  @JsonKey(name: 'activity_state')
  final dynamic activityState;
  final List<ActivityIdModel>? _activityIds;
  @override
  @JsonKey(name: 'activity_ids')
  List<ActivityIdModel>? get activityIds {
    final value = _activityIds;
    if (value == null) return null;
    if (_activityIds is EqualUnmodifiableListView) return _activityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'activity_exception_decoration')
  final bool activityExceptionDecoration;
  @override
  @JsonKey(name: 'activity_exception_icon')
  final bool activityExceptionIcon;
  @override
  @JsonKey(name: 'activity_summary')
  final dynamic activitySummary;
  @override
  @JsonKey(name: 'activity_type_icon')
  final dynamic activityTypeIcon;
  @override
  @JsonKey(name: 'activity_type_id')
  final dynamic activityTypeId;

  @override
  String toString() {
    return 'QuotationRecord(id: $id, name: $name, partnerId: $partnerId, amountTotal: $amountTotal, amountToInvoice: $amountToInvoice, dateOrder: $dateOrder, state: $state, currencyId: $currencyId, activityState: $activityState, activityIds: $activityIds, activityExceptionDecoration: $activityExceptionDecoration, activityExceptionIcon: $activityExceptionIcon, activitySummary: $activitySummary, activityTypeIcon: $activityTypeIcon, activityTypeId: $activityTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotationRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.amountTotal, amountTotal) ||
                other.amountTotal == amountTotal) &&
            (identical(other.amountToInvoice, amountToInvoice) ||
                other.amountToInvoice == amountToInvoice) &&
            (identical(other.dateOrder, dateOrder) ||
                other.dateOrder == dateOrder) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            const DeepCollectionEquality()
                .equals(other.activityState, activityState) &&
            const DeepCollectionEquality()
                .equals(other._activityIds, _activityIds) &&
            (identical(other.activityExceptionDecoration,
                    activityExceptionDecoration) ||
                other.activityExceptionDecoration ==
                    activityExceptionDecoration) &&
            (identical(other.activityExceptionIcon, activityExceptionIcon) ||
                other.activityExceptionIcon == activityExceptionIcon) &&
            const DeepCollectionEquality()
                .equals(other.activitySummary, activitySummary) &&
            const DeepCollectionEquality()
                .equals(other.activityTypeIcon, activityTypeIcon) &&
            const DeepCollectionEquality()
                .equals(other.activityTypeId, activityTypeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      partnerId,
      amountTotal,
      amountToInvoice,
      dateOrder,
      state,
      currencyId,
      const DeepCollectionEquality().hash(activityState),
      const DeepCollectionEquality().hash(_activityIds),
      activityExceptionDecoration,
      activityExceptionIcon,
      const DeepCollectionEquality().hash(activitySummary),
      const DeepCollectionEquality().hash(activityTypeIcon),
      const DeepCollectionEquality().hash(activityTypeId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotationRecordImplCopyWith<_$QuotationRecordImpl> get copyWith =>
      __$$QuotationRecordImplCopyWithImpl<_$QuotationRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotationRecordImplToJson(
      this,
    );
  }
}

abstract class _QuotationRecord implements QuotationRecord {
  const factory _QuotationRecord(
          {required final int? id,
          required final String? name,
          @JsonKey(name: 'partner_id') required final IdModel? partnerId,
          @JsonKey(name: 'amount_total') required final double? amountTotal,
          @JsonKey(name: 'amount_to_invoice')
          required final double? amountToInvoice,
          @JsonKey(name: 'date_order') required final DateTime? dateOrder,
          required final String? state,
          @JsonKey(name: 'currency_id') required final IdModel? currencyId,
          @JsonKey(name: 'activity_state') final dynamic activityState,
          @JsonKey(name: 'activity_ids')
          required final List<ActivityIdModel>? activityIds,
          @JsonKey(name: 'activity_exception_decoration')
          final bool activityExceptionDecoration,
          @JsonKey(name: 'activity_exception_icon')
          final bool activityExceptionIcon,
          @JsonKey(name: 'activity_summary') final dynamic activitySummary,
          @JsonKey(name: 'activity_type_icon') final dynamic activityTypeIcon,
          @JsonKey(name: 'activity_type_id') final dynamic activityTypeId}) =
      _$QuotationRecordImpl;

  factory _QuotationRecord.fromJson(Map<String, dynamic> json) =
      _$QuotationRecordImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'partner_id')
  IdModel? get partnerId;
  @override
  @JsonKey(name: 'amount_total')
  double? get amountTotal;
  @override
  @JsonKey(name: 'amount_to_invoice')
  double? get amountToInvoice;
  @override
  @JsonKey(name: 'date_order')
  DateTime? get dateOrder;
  @override
  String? get state;
  @override
  @JsonKey(name: 'currency_id')
  IdModel? get currencyId;
  @override
  @JsonKey(name: 'activity_state')
  dynamic get activityState;
  @override
  @JsonKey(name: 'activity_ids')
  List<ActivityIdModel>? get activityIds;
  @override
  @JsonKey(name: 'activity_exception_decoration')
  bool get activityExceptionDecoration;
  @override
  @JsonKey(name: 'activity_exception_icon')
  bool get activityExceptionIcon;
  @override
  @JsonKey(name: 'activity_summary')
  dynamic get activitySummary;
  @override
  @JsonKey(name: 'activity_type_icon')
  dynamic get activityTypeIcon;
  @override
  @JsonKey(name: 'activity_type_id')
  dynamic get activityTypeId;
  @override
  @JsonKey(ignore: true)
  _$$QuotationRecordImplCopyWith<_$QuotationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdModel _$IdModelFromJson(Map<String, dynamic> json) {
  return _IdModel.fromJson(json);
}

/// @nodoc
mixin _$IdModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdModelCopyWith<IdModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdModelCopyWith<$Res> {
  factory $IdModelCopyWith(IdModel value, $Res Function(IdModel) then) =
      _$IdModelCopyWithImpl<$Res, IdModel>;
  @useResult
  $Res call({int? id, @JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class _$IdModelCopyWithImpl<$Res, $Val extends IdModel>
    implements $IdModelCopyWith<$Res> {
  _$IdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdModelImplCopyWith<$Res> implements $IdModelCopyWith<$Res> {
  factory _$$IdModelImplCopyWith(
          _$IdModelImpl value, $Res Function(_$IdModelImpl) then) =
      __$$IdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, @JsonKey(name: 'display_name') String? displayName});
}

/// @nodoc
class __$$IdModelImplCopyWithImpl<$Res>
    extends _$IdModelCopyWithImpl<$Res, _$IdModelImpl>
    implements _$$IdModelImplCopyWith<$Res> {
  __$$IdModelImplCopyWithImpl(
      _$IdModelImpl _value, $Res Function(_$IdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$IdModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdModelImpl implements _IdModel {
  const _$IdModelImpl(
      {required this.id,
      @JsonKey(name: 'display_name') required this.displayName});

  factory _$IdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;

  @override
  String toString() {
    return 'IdModel(id: $id, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdModelImplCopyWith<_$IdModelImpl> get copyWith =>
      __$$IdModelImplCopyWithImpl<_$IdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdModelImplToJson(
      this,
    );
  }
}

abstract class _IdModel implements IdModel {
  const factory _IdModel(
          {required final int? id,
          @JsonKey(name: 'display_name') required final String? displayName}) =
      _$IdModelImpl;

  factory _IdModel.fromJson(Map<String, dynamic> json) = _$IdModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$IdModelImplCopyWith<_$IdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityIdModel _$ActivityIdModelFromJson(Map<String, dynamic> json) {
  return _ActivityIdModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityIdModel {
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityIdModelCopyWith<ActivityIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityIdModelCopyWith<$Res> {
  factory $ActivityIdModelCopyWith(
          ActivityIdModel value, $Res Function(ActivityIdModel) then) =
      _$ActivityIdModelCopyWithImpl<$Res, ActivityIdModel>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$ActivityIdModelCopyWithImpl<$Res, $Val extends ActivityIdModel>
    implements $ActivityIdModelCopyWith<$Res> {
  _$ActivityIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityIdModelImplCopyWith<$Res>
    implements $ActivityIdModelCopyWith<$Res> {
  factory _$$ActivityIdModelImplCopyWith(_$ActivityIdModelImpl value,
          $Res Function(_$ActivityIdModelImpl) then) =
      __$$ActivityIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$ActivityIdModelImplCopyWithImpl<$Res>
    extends _$ActivityIdModelCopyWithImpl<$Res, _$ActivityIdModelImpl>
    implements _$$ActivityIdModelImplCopyWith<$Res> {
  __$$ActivityIdModelImplCopyWithImpl(
      _$ActivityIdModelImpl _value, $Res Function(_$ActivityIdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ActivityIdModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityIdModelImpl implements _ActivityIdModel {
  const _$ActivityIdModelImpl({required this.id});

  factory _$ActivityIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityIdModelImplFromJson(json);

  @override
  final int? id;

  @override
  String toString() {
    return 'ActivityIdModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityIdModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityIdModelImplCopyWith<_$ActivityIdModelImpl> get copyWith =>
      __$$ActivityIdModelImplCopyWithImpl<_$ActivityIdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityIdModelImplToJson(
      this,
    );
  }
}

abstract class _ActivityIdModel implements ActivityIdModel {
  const factory _ActivityIdModel({required final int? id}) =
      _$ActivityIdModelImpl;

  factory _ActivityIdModel.fromJson(Map<String, dynamic> json) =
      _$ActivityIdModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$ActivityIdModelImplCopyWith<_$ActivityIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
