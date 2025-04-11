import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

Future<Database> createLocalDatabase({required String installationPath}) async {
  final Directory dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  final String dbPath = join(dir.path, installationPath);
  final Database db = await databaseFactoryIo.openDatabase(dbPath);
  return db;
}
