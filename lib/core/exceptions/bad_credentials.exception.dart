import 'package:mon_app_flutter/core/exceptions/text.exception.dart';

final class BadCredentialsException extends TextException {
  BadCredentialsException({required super.message});
}
