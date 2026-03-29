import 'package:hive_ce/hive.dart';

part 'application_status.g.dart';

@HiveType(typeId: 1)
enum ApplicationStatus {
  @HiveField(0)
  noReply,

  @HiveField(1)
  accepted,

  @HiveField(2)
  rejected,
}
