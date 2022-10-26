import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showSuccess(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
        backgroundColor: const Color.fromARGB(255, 14, 53, 17).withOpacity(0.5),
      ),
    );
  }

  void showError(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
        backgroundColor: context.primaryColor,
      ),
    );
  }

  void showInfo(String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
