class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'يجب أن تحتوي على حرف صغير';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الجوال مطلوب';
    }
    final phoneRegex = RegExp(r'^(05|5)\d{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'رقم الجوال غير صالح (مثال: 05xxxxxxxx)';
    }
    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    if (double.tryParse(value) == null) {
      return '$fieldName يجب أن يكون رقماً';
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final urlRegex = RegExp(r'^(http|https)://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(/\S*)?$');
    if (!urlRegex.hasMatch(value)) {
      return 'الرابط غير صالح';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'التاريخ مطلوب';
    }
    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'التاريخ غير صالح';
    }
  }

  static String? validateSaudiID(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهوية مطلوب';
    }
    if (value.length != 10) {
      return 'رقم الهوية يجب أن يكون 10 أرقام';
    }
    if (!RegExp(r'^[12]\d{9}$').hasMatch(value)) {
      return 'رقم الهوية غير صالح';
    }
    return null;
  }

  static String? validateCommercialRegistration(String? value) {
    if (value == null || value.isEmpty) {
      return 'السجل التجاري مطلوب';
    }
    if (value.length != 10) {
      return 'السجل التجاري يجب أن يكون 10 أرقام';
    }
    return null;
  }
}
