import 'dart:async';

import 'package:flutter/material.dart';

abstract class DialogService {
  Future<StreamController<String>?> showLoadingDialog({
    bool dismissible = false,
  });
  Future<void> showCustomDialog({required Widget child});
  Future<void> showErrorDiablog(String error);
  void closeLoadingDialog();
}
