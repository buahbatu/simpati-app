import 'package:flutter/material.dart';

class FormUtils {
  static TextFormField buildField(
    String label, {
    String value,
    bool isEnabled = true,
    String suffix,
  }) {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      enabled: isEnabled,
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        isDense: true,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
