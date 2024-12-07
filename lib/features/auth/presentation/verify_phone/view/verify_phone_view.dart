// import 'package:flutter/material.dart';
//
// import '../../../../../utils/style/colors.dart';
// import 'widget/new_account_text.dart';
// import 'widget/phone_field.dart';
// import 'widget/verify_btn.dart';
// import 'widget/welcome_mes.dart';
//
// class VerifyPhoneView extends StatefulWidget {
//   const VerifyPhoneView({super.key});
//
//   static const routeName = "/verify-phone";
//
//   @override
//   State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
// }
//
// class _VerifyPhoneViewState extends State<VerifyPhoneView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late TextEditingController _phoneNumberController;
//
//   @override
//   void initState() {
//     super.initState();
//     _phoneNumberController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(),
//           SliverPadding(
//             padding: const EdgeInsets.all(18),
//             sliver: SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   const AppLogo(),
//                   const SizedBox(height: 40),
//                   const WelcomeMes(),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         const NewAccountText(),
//                         const SizedBox(height: 20),
//                         PhoneField(
//                           controller: _phoneNumberController,
//                         ),
//                         const SizedBox(height: 40),
//                         VerifyBtn(
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _phoneNumberController.dispose();
//     super.dispose();
//   }
// }
