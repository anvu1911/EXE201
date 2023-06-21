import 'package:hive/hive.dart';
part 'type_enum.g.dart';

@HiveType(typeId: 04)
enum TypeEnum {
  @HiveField(0)
  wakeTime,

  @HiveField(1)
  bedTime,
}
