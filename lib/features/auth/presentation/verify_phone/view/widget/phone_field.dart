// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../../../../core/utils/app_colors.dart';
//
// class PhoneField extends StatelessWidget {
//   const PhoneField({
//     required TextEditingController controller,
//     super.key,
//   }) : _controller = controller;
//
//   final TextEditingController _controller;
//
//   OutlineInputBorder _getBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: AppColors.primaryColor),
//     );
//   }
//
//   OutlineInputBorder _getEnabledBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: const BorderSide(color: AppColors.color3),
//     );
//   }
//
//   OutlineInputBorder _getErrorBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: const BorderSide(color: AppColors.red),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: _controller,
//       textInputAction: TextInputAction.next,
//       keyboardType: TextInputType.phone,
//       inputFormatters: [
//         // ignore spaces.
//         FilteringTextInputFormatter.deny(RegExp(r'\s')),
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//       validator: (value) {
//         value = value!.trim();
//         const pattern = r'(^[0-9]*$)';
//         final regExp = RegExp(pattern);
//         if (value.isEmpty) {
//           return 'غير صالح';
//         } else if (value.length < 8) {
//           return 'قم بادخال رقم هاتف صالح';
//         } else if (!regExp.hasMatch(value)) {
//           return 'قم بادخال رقم هاتف صالح';
//         }
//         return null;
//       },
//       style: const TextStyle(
//         color: AppColors.white,
//         fontSize: 12,
//       ),
//       decoration: InputDecoration(
//         fillColor: Colors.white,
//         filled: true,
//         border: _getBorder(),
//         disabledBorder: _getBorder(),
//         focusedBorder: _getBorder(),
//         enabledBorder: _getEnabledBorder(),
//         errorBorder: _getErrorBorder(),
//         focusedErrorBorder: _getErrorBorder(),
//         filled: true,
//         fillColor: AppColors.color3,
//         labelText: 'رقم الهاتف',
//         labelStyle: const TextStyle(
//           color: AppColors.white,
//           fontSize: 14,
//         ),
//         errorStyle: const TextStyle(
//           color: AppColors.appRed,
//           //height: errorHeight,
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//         ),
//         isDense: true,
//         contentPadding: const EdgeInsetsDirectional.all(17.5),
//         prefixIcon: const Icon(Icons.phone),
//         suffixIcon: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
//               child: Text(
//                 '+965',
//                 style: TextStyle(
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
