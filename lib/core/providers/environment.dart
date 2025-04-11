import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'environment.g.dart';

enum Environment { mock, dev }

@Riverpod(keepAlive: true)
Environment env(Ref ref) {
  /// Ensures appFlavor is set
  if (appFlavor == null) {
    throw Exception('Missing --flavor !');
  }

  switch (appFlavor) {
    case 'dev':
      return Environment.dev;
    default:
      return Environment.mock;
  }
}
