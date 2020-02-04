import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';

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

  static Widget createChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColor.accentColor),
      child: Text(
        title,
        style: AppTextStyle.caption.copyWith(fontSize: 14),
      ),
    );
  }
}
