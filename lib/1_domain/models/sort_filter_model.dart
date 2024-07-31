enum SortBy {
  newestFirst,
  oldestFirst,
  aZCourseName,
  zACourseName;

  String get name {
    return switch (this) {
      SortBy.newestFirst => 'Newest',
      SortBy.oldestFirst => 'Oldest',
      SortBy.aZCourseName => 'A-Z (Sales Rep)',
      SortBy.zACourseName => 'Z-A (Sales Rep)',
    };
  }
}

SortBy convertStringToSortBy(String statusString) {
  switch (statusString) {
    case 'Newest':
      return SortBy.newestFirst;
    case 'Oldest':
      return SortBy.oldestFirst;
    case 'A-Z (Sales Rep)':
      return SortBy.aZCourseName;
    case 'Z-A (Sales Rep)':
      return SortBy.zACourseName;
    default:
      throw Exception('Unsupported statusString: $statusString');
  }
}

List<String> convertSortByToStrings(
  List<SortBy> statuses,
) {
  return statuses.map((status) => status.name).toList();
}

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
      CommissionStatus.paid => 'true',
      CommissionStatus.notPaid => 'false',
    };
  }
}

List<String> convertCommissionStatusesToStrings(
  List<CommissionStatus> statuses,
) {
  return statuses.map((status) => status.backendName).toList();
}

List<CommissionStatus> convertStringsToCommissionStatuses(
  List<String> statusStrings,
) {
  return statusStrings.map((statusString) {
    switch (statusString) {
      case 'true':
        return CommissionStatus.paid;
      case 'false':
        return CommissionStatus.notPaid;
      default:
        throw Exception('Unsupported backendName: $statusString');
    }
  }).toList();
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

List<String> convertInvoicePaymentStatusesToStrings(
  List<InvoicePaymentStatus> statuses,
) {
  return statuses.map((status) => status.backendName).toList();
}

List<InvoicePaymentStatus> convertStringsToInvoicePaymentStatuses(
  List<String> statusStrings,
) {
  return statusStrings.map((statusString) {
    switch (statusString) {
      case 'paid':
        return InvoicePaymentStatus.full;
      case 'partial':
        return InvoicePaymentStatus.partial;
      case 'not_paid':
        return InvoicePaymentStatus.notPaid;
      case 'false':
        return InvoicePaymentStatus.notSet;
      default:
        throw Exception('Unsupported backendName: $statusString');
    }
  }).toList();
}

enum DeliveryStatus {
  full,
  partial,
  notDelivered;

  String get name {
    return switch (this) {
      DeliveryStatus.full => 'Fully Delivered',
      DeliveryStatus.partial => 'Partially Delivered',
      DeliveryStatus.notDelivered => 'Not Delivered',
    };
  }

  String get backendName {
    return switch (this) {
      DeliveryStatus.full => 'full',
      DeliveryStatus.partial => 'partial',
      DeliveryStatus.notDelivered => 'pending',
    };
  }
}

List<String> convertDeliveryStatusesToStrings(
  List<DeliveryStatus> statuses,
) {
  return statuses.map((status) => status.backendName).toList();
}

List<DeliveryStatus> convertStringsToDeliveryStatuses(
  List<String> statusStrings,
) {
  return statusStrings.map((statusString) {
    switch (statusString) {
      case 'full':
        return DeliveryStatus.full;
      case 'partial':
        return DeliveryStatus.partial;
      case 'pending':
        return DeliveryStatus.notDelivered;
      default:
        throw Exception('Unsupported backendName: $statusString');
    }
  }).toList();
}
