// ignore_for_file: avoid_positional_boolean_parameters, avoid_bool_literals_in_conditional_expressions, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/core/helper.dart';

// Widget customTextField(
//   TextEditingController ctrl,
//   // ignore: inference_failure_on_function_return_type
//   Function(String) onChanged,
//   String title,
//   bool isValidating,
//   TextInputType? inputType,
// ) {
//   bool isPasswordVisible = false;

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: const TextStyle(fontSize: 16),
//       ),
//       const SizedBox(
//         height: 4,
//       ),
//       TextFormField(
//         keyboardType: inputType ?? TextInputType.text,
//         controller: ctrl,
//         enableSuggestions: false,
//         autocorrect: false,
//         obscureText: inputType == TextInputType.visiblePassword
//             ? !isPasswordVisible
//             : true,
//         inputFormatters: [
//           if (inputType == TextInputType.phone) ...[NumberTextInputFormatter()],
//           if (inputType == TextInputType.number) ...[DoubleInputFormatter()],
//         ],
//         decoration: InputDecoration(
//           prefixText: inputType == TextInputType.number ? r'$' : null,
//           border: const OutlineInputBorder(),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey, width: 0),
//           ),
//           labelStyle: const TextStyle(color: Colors.green),
//           hintText: 'Input $title',
//           suffixIcon: IconButton(
//             icon: Icon(
//               isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//             ),
//             onPressed: () {
//               isPasswordVisible = !isPasswordVisible;
//             },
//           ),
//         ),
//         onChanged: onChanged,
//       ),
//       if (isValidating)
//         ctrl.text.isEmpty
//             ? Text(
//                 '$title is required',
//                 style: const TextStyle(color: Colors.red),
//               )
//             : const SizedBox.shrink(),
//       const SizedBox(
//         height: 12,
//       ),
//     ],
//   );
// }

class CustomTextField extends HookWidget {
  const CustomTextField({
    required this.ctrl,
    required this.onChanged,
    required this.title,
    required this.isValidating,
    this.inputType,
    super.key,
  });
  final TextEditingController ctrl;
  final Function(String) onChanged;
  final String title;
  final bool isValidating;
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
          ctrl.text.isEmpty
              ? Text(
                  '$title is required',
                  style: const TextStyle(color: Colors.red),
                )
              : const SizedBox.shrink(),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
