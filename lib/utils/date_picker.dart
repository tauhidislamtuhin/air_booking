import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<void> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    required ValueChanged<DateTime> onSelected,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      onSelected(picked);
    }
  }
}