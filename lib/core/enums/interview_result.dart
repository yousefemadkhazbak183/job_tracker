import 'package:hive_ce/hive.dart';

part 'interview_result.g.dart';

@HiveType(typeId: 2)
enum InterviewResult {
  @HiveField(0)
  accepted,

  @HiveField(1)
  rejected,
}
