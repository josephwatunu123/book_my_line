import 'package:flutter/material.dart';
import 'package:mobile/utils/global_keys.dart';

enum SnackBarType { success, warning, error }

class SnackBarService {
  static void show({
    required String message,
    required String title,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    required SnackBarType snackBarType,
  }) {
    final backgroundColor = _getBackgroundColor(snackBarType);

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      duration: duration,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              if (icon != null) Icon(icon, size: 16, color: Colors.white),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );

    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Color _getBackgroundColor(type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.warning:
        return Colors.orange;
      case SnackBarType.error:
        return Colors.red;
      default:
        return Colors.deepPurple;
    }
  }
}
