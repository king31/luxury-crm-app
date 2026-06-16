import 'package:intl/intl.dart';

class AppFormatters {
  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'ar_SA',
    symbol: 'ر.س',
    decimalDigits: 2,
  );

  static final NumberFormat _numberFormat = NumberFormat('#,##0', 'ar');
  static final NumberFormat _percentFormat = NumberFormat.percentPattern('ar');
  static final NumberFormat _decimalFormat = NumberFormat('#,##0.00', 'ar');

  static String formatCurrency(double amount) {
    return _currencyFormat.format(amount);
  }

  static String formatNumber(int number) {
    return _numberFormat.format(number);
  }

  static String formatPercent(double value) {
    return _percentFormat.format(value);
  }

  static String formatDecimal(double value) {
    return _decimalFormat.format(value);
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  static String formatPhoneNumber(String phone) {
    if (phone.length == 10) {
      return '${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7)}';
    }
    return phone;
  }

  static String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} يوم ${duration.inHours % 24} ساعة';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} ساعة ${duration.inMinutes % 60} دقيقة';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} دقيقة';
    }
    return '${duration.inSeconds} ثانية';
  }
}
