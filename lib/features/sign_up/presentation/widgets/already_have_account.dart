import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/login/presentation/pages/login_screen.dart';
import 'package:sizer/sizer.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "already_have_account".tr(),
          style: const TextStyle(
            color: AppColors.textGrey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        InkWell(
            onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>  LoginScreen()));
            
            },
            child: Text("sign_in".tr(),
                style:  TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)))
      ],
    );
  }
}
