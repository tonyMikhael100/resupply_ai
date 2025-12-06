import 'package:flutter/material.dart';
import 'package:resupply_ai/core/themes/app_colors.dart';
import 'package:toastification/toastification.dart';

class MyToast {
  // Private constructor — ensures only static usage
  MyToast._();

  /// General toast function
  static void show({
    required BuildContext context,
    required String title,
    String? description,
    ToastificationType type = ToastificationType.info,
    Duration duration = const Duration(seconds: 3),
    Alignment alignment = Alignment.topRight,
  }) {
    final colorScheme = _getColorScheme(type);
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      autoCloseDuration: duration,
      alignment: alignment,
      animationDuration: const Duration(milliseconds: 300),
      pauseOnHover: true,
      applyBlurEffect: false,
      dragToClose: true,
      showProgressBar: true,
      closeOnClick: false,

      // --- Custom visuals ---
      icon: Icon(colorScheme.icon, color: colorScheme.primary, size: 26),
      showIcon: true,
      primaryColor: colorScheme.primary,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),

      // --- Text Content ---
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: colorScheme.primary,
        ),
      ),
      description: description != null
          ? Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            )
          : null,

      // --- Close Button ---
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.onHover,
        buttonBuilder: (context, onClose) {
          return IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 18, color: Colors.black45),
          );
        },
      ),

      // --- Callbacks (optional) ---
    );
  }

  /// Convenience shortcuts
  static void success(BuildContext context, String title,
      {String? description}) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.success,
    );
  }

  static void error(BuildContext context, String title, {String? description}) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.error,
    );
  }

  static void warning(BuildContext context, String title,
      {String? description}) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.warning,
    );
  }

  static void info(BuildContext context, String title, {String? description}) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.info,
    );
  }

  /// Internal helper for colors & icons
  static _ToastColorScheme _getColorScheme(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return _ToastColorScheme(
          primary: AppColors.primaryColor,
          icon: Icons.check_circle,
        );
      case ToastificationType.error:
        return _ToastColorScheme(
          primary: Colors.red,
          icon: Icons.error_outline,
        );
      case ToastificationType.warning:
        return _ToastColorScheme(
          primary: Colors.orange,
          icon: Icons.warning_amber_rounded,
        );
      case ToastificationType.info:
      default:
        return _ToastColorScheme(
          primary: Colors.blue,
          icon: Icons.info_outline,
        );
    }
  }
}

class _ToastColorScheme {
  final Color primary;
  final IconData icon;

  const _ToastColorScheme({
    required this.primary,
    required this.icon,
  });
}
