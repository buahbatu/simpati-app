import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';

typedef StringCallback = void Function(String data);

class NextForm {
  final FocusScopeNode scopeNode;
  final FocusNode nextNode;

  NextForm(this.scopeNode, this.nextNode);
}

class FormUtils {
  static TextFormField buildField(
    String label, {
    String value,
    String suffix,
    bool isEnabled = true,
    bool obscureText = false,
    NextForm nextForm,
    FocusNode focusNode,
    StringCallback onChanged,
    String errorText,
    TextInputType inputType,
    TextEditingController controller,
  }) {
    final inputAction =
        nextForm == null ? TextInputAction.done : TextInputAction.next;
    return TextFormField(
      maxLines: 1,
      textInputAction: inputAction,
      enabled: isEnabled,
      initialValue: value,
      keyboardType: inputType,
      focusNode: focusNode,
      controller: controller,
      onFieldSubmitted: (text) {
        if (nextForm != null) {
          nextForm.scopeNode.requestFocus(nextForm.nextNode);
        }
      },
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
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

extension on TextFormField {}
