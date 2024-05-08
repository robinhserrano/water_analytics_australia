
class OrderLine with _$OrderLine {
  const factory OrderLine({
    required int? id,
    required String? name, //A
    @JsonKey(name: 'create_date') required DateTime? createDate, //B
    @JsonKey(name: 'partner_id') required PartnerIdModel? partnerId, //C-E
    @JsonKey(name: 'x_studio_sales_rep_1') required String xStudioSalesRep1, //F
    @JsonKey(name: 'x_studio_sales_source')
    required String xStudioSalesSource, //G
    @JsonKey(name: 'x_studio_commission_paid')
    required bool xStudioCommissionPaid, //H,
    @JsonKey(name: 'x_studio_referred_by')
    @BoolRefferedByConverter()
    required ReferredByModel xStudioReferredBy,
    @JsonKey(name: 'x_studio_referrer_processed')
    required bool xStudioReferrerProcessed, //J,
    @JsonKey(name: 'x_studio_payment_type')
    required String xStudioPaymentType, //K
    @JsonKey(name: 'amount_total') required double? amountTotal, // L
    @JsonKey(name: 'delivery_status') required dynamic deliveryStatus, //M
    @JsonKey(name: 'amount_to_invoice') required double? amountToInvoice, //N
    @JsonKey(name: 'x_studio_invoice_payment_status')
    required dynamic xStudioInvoicePaymentStatus, //O
    @JsonKey(name: 'internal_note_display') //P
    required String? internalNoteDisplay,
    required String? state,
    @JsonKey(name: 'user_id')
    @BoolRefferedByConverter()
    required ReferredByModel userId,
  }) = _OrderLine;

  factory OrderLine.fromJson(Map<String, dynamic> json) =>
      _$OrderLineFromJson(json);
}
