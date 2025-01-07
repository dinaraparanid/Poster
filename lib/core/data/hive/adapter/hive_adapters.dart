import 'package:hive_ce/hive.dart';
import 'package:poster/core/domain/notification/entity/notification.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Notification>()])
void _() {}
