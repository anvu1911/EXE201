import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/enums/repeat_enum.dart';
import '../../domain/enums/type_enum.dart';
import '../../domain/models/models.dart';
import '../data.dart';

// ignore: avoid_classes_with_only_static_members
class LocalStorage {
  static Future<dynamic> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(AlarmsModelAdapter())
      ..registerAdapter(RepeatEnumAdapter())
      ..registerAdapter(TypeEnumAdapter());
    await AlarmData.init();
  }
}
