import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/value/app_globals/app_constants.dart';
import 'package:user_provider/value/app_globals/app_strings.dart';

import '../model/user_model.dart';
import '../utils/provider/user_provider.dart';

class AppValidators {
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return AppStrings.pleaseProvideValid(detail: 'Name');
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.pleaseProvideValid(detail: 'email');
    }

    RegExp emailCheck = AppConstants.emailRegex;

    if (!emailCheck.hasMatch(email)) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  static String? mobileNumValidator(String? mobileNum) {
    if (mobileNum == null || mobileNum.isEmpty) {
      return AppStrings.pleaseProvideValid(detail: 'Mobile Number');
    }

    if (mobileNum.length != 10) {
      return AppStrings.invalidMobile;
    }

    return null;
  }

  static String? addressValidator(String? address) {
    if (address == null || address.isEmpty) {
      return AppStrings.pleaseProvideValid(detail: 'address');
    }
    return null;
  }

  static void validateEditUser(GlobalKey<FormState> formKey, BuildContext context, int userIndex, User user) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<UserProvider>().editUserAt(
            userIndex,
            user,
          );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  static void validateAddUser(GlobalKey<FormState> formKey, BuildContext context, User user) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<UserProvider>().addUser(user);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
