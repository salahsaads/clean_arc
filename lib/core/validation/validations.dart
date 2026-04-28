import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'emailValidationEmpty'.tr();
    }
    if (!value.contains('@')) {
      return 'emailValidationInvalid'.tr();
    }
    return null;
  }

  static String? validateEmptyPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordValidationEmpty'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordValidationEmpty'.tr();
    }
    if (value.length < 8) {
      return 'passwordValidationLength'.tr();
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'passwordValidationUppercase'.tr();
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'passwordValidationLowercase'.tr();
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'passwordValidationNumber'.tr();
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'passwordValidationSpecial'.tr();
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'nameValidationEmpty'.tr();
    }
    if (value.length < 3) {
      return 'nameValidationLength'.tr();
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'nameValidationEmpty'.tr();
    }
    if (value.length < 3) {
      return 'nameValidationLength'.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'emptyPhone'.tr();
    }
    if (value.length < 10) {
      return 'phoneValidationInvalid'.tr();
    }
    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '${'pleaseEnter'.tr()} $fieldName';
    }
    return null;
  }

  static String? validateIssueDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'messageEmptyError'.tr();
    }
    return null;
  }

  static String? validateSelectedCar(int? selectedCar) {
    if (selectedCar == null) {
      return 'selectCarError'.tr();
    }
    return null;
  }

  static String? validateSelectedDate(DateTime? selectedDate) {
    if (selectedDate == null) {
      return 'selectDateError'.tr();
    }
    return null;
  }

  static String? validateSelectedTime(TimeOfDay? selectedTime) {
    if (selectedTime == null) {
      return 'selectTimeError'.tr();
    }
    return null;
  }

  static String? validateNewPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'passwordValidationEmpty'.tr();
    }
    if (value.length < 6) {
      return 'passwordValidationLength'.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'passwordValidationConfirmEmpty'.tr();
    }
    if (value != password) {
      return 'passwordMismatch'.tr();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'otpValidationEmpty'.tr();
    }
    if (value.length < 5) {
      return 'otpValidationLength'.tr();
    }
    return null;
  }
}
