enum CommissionStatus {
  paid,
  notPaid;

  String get name {
    return switch (this) {
      CommissionStatus.paid => 'Paid',
      CommissionStatus.notPaid => 'Not Paid',
    };
  }

  String get backendName {
    return switch (this) {
      CommissionStatus.paid => 'paid',
      CommissionStatus.notPaid => 'not_paid',
    };
  }
}

enum InvoicePaymentStatus {
  full,
  partial,
  notPaid,
  notSet;

  String get name {
    return switch (this) {
      InvoicePaymentStatus.full => 'Paid',
      InvoicePaymentStatus.partial => 'Partial',
      InvoicePaymentStatus.notPaid => 'Not Paid',
      InvoicePaymentStatus.notSet => 'Not Set',
    };
  }

  String get backendName {
    return switch (this) {
      InvoicePaymentStatus.full => 'paid',
      InvoicePaymentStatus.partial => 'partial',
      InvoicePaymentStatus.notPaid => 'not_paid',
      InvoicePaymentStatus.notSet => 'false',
    };
  }
}

enum DeliveryStatus {
  full,
  partial,
  not;

  String get name {
    return switch (this) {
      DeliveryStatus.full => 'Fully Delivered',
      DeliveryStatus.partial => 'Partially Delivered',
      DeliveryStatus.not => 'Not Delivered',
    };
  }

  String get backendName {
    return switch (this) {
      DeliveryStatus.full => 'full',
      DeliveryStatus.partial => 'partial',
      DeliveryStatus.not => 'pending',
    };
  }
}
