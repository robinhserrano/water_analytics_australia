// ignore_for_file: avoid_positional_boolean_parameters, avoid_bool_literals_in_conditional_expressions, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/core/helper.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    required this.ctrl,
    required this.onChanged,
    required this.title,
    required this.isValidating,
    this.inputType,
    this.prioValidate = false,
    super.key,
  });
  final TextEditingController ctrl;
  final Function(String) onChanged;
  final String title;
  final bool isValidating;
  final bool prioValidate;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false); // Manage password visibility

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          maxLines: inputType == TextInputType.visiblePassword ? 1 : null,
          keyboardType: inputType ?? TextInputType.text,
          controller: ctrl,
          enableSuggestions: false,
          autocorrect: false,
          obscureText: inputType == TextInputType.visiblePassword
              ? !isPasswordVisible.value
              : false,
          inputFormatters: [
            if (inputType == TextInputType.phone) ...[
              NumberTextInputFormatter(),
            ],
            if (inputType == TextInputType.number) ...[DoubleInputFormatter()],
            if (inputType ==
                const TextInputType.numberWithOptions(decimal: true)) ...[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            if (inputType ==
                const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                )) ...[
              FilteringTextInputFormatter.allow(
                RegExp(
                  r'^-?\d*\.?\d*$',
                ),
              ),
            ],
          ],
          decoration: InputDecoration(
            prefixText: inputType == TextInputType.number ? r'$' : null,
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0),
            ),
            labelStyle: const TextStyle(color: Colors.green),
            hintStyle: const TextStyle(color: Color(0xffc3c2c7)),
            hintText: 'Enter $title',
            suffixIcon: inputType == TextInputType.visiblePassword
                ? IconButton(
                    icon: HeroIcon(
                      isPasswordVisible.value
                          ? HeroIcons.eye
                          : HeroIcons.eyeSlash,
                    ),
                    onPressed: () =>
                        isPasswordVisible.value = !isPasswordVisible.value,
                  )
                : null,
          ),
          onChanged: onChanged,
        ),
        if (isValidating)
          (ctrl.text.isEmpty || prioValidate)
              ? Text(
                  '$title is required',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              : const SizedBox.shrink(),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
