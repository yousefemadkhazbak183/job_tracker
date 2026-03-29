import 'package:hive_ce/hive.dart';
import 'package:job_tracker/core/enums/application_status.dart';
import 'package:job_tracker/core/enums/interview_result.dart';

import 'package:job_tracker/features/applications/domain/entities/job_application.dart';

part 'job_application_model.g.dart';

@HiveType(typeId: 0)
class JobApplicationModel extends JobApplication {
  @HiveField(0)
  final String modelId;

  @HiveField(1)
  final String modelCompanyName;

  @HiveField(2)
  final String modelSource;

  @HiveField(3)
  final DateTime modelAppliedDate;

  @HiveField(4)
  final ApplicationStatus modelStatus;

  @HiveField(5)
  final String? modelJobUrl;

  @HiveField(6)
  final String? modelCompanyEmail;

  @HiveField(7)
  final String? modelHrName;

  @HiveField(8)
  final String? modelHrLinkedInUrl;

  @HiveField(9)
  final DateTime? modelInterviewDate;

  @HiveField(10)
  final InterviewResult? modelInterviewResult;

  const JobApplicationModel({
    required this.modelId,
    required this.modelCompanyName,
    required this.modelSource,
    required this.modelAppliedDate,
    required this.modelStatus,
    this.modelJobUrl,
    this.modelCompanyEmail,
    this.modelHrName,
    this.modelHrLinkedInUrl,
    this.modelInterviewDate,
    this.modelInterviewResult,
  }) : super(
         id: modelId,
         companyName: modelCompanyName,
         source: modelSource,
         appliedDate: modelAppliedDate,
         status: modelStatus,
         jobUrl: modelJobUrl,
         companyEmail: modelCompanyEmail,
         hrName: modelHrName,
         hrLinkedInUrl: modelHrLinkedInUrl,
         interviewDate: modelInterviewDate,
         interviewResult: modelInterviewResult,
       );

  factory JobApplicationModel.fromEntity(JobApplication entity) {
    return JobApplicationModel(
      modelId: entity.id,
      modelCompanyName: entity.companyName,
      modelSource: entity.source,
      modelAppliedDate: entity.appliedDate,
      modelStatus: entity.status,
      modelJobUrl: entity.jobUrl,
      modelCompanyEmail: entity.companyEmail,
      modelHrName: entity.hrName,
      modelHrLinkedInUrl: entity.hrLinkedInUrl,
      modelInterviewDate: entity.interviewDate,
      modelInterviewResult: entity.interviewResult,
    );
  }
}
