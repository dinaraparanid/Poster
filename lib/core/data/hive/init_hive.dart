import 'package:path_provider/path_provider.dart';
import 'package:hive_ce/hive.dart';
import 'package:poster/core/data/hive/adapter/hive_registrar.g.dart';

Future<void> initHive() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive..init(dir.path)..registerAdapters();
}
