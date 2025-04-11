import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timezone.g.dart';

@riverpod
Future<String> timezone(Ref ref) {
  return FlutterTimezone.getLocalTimezone();
}
