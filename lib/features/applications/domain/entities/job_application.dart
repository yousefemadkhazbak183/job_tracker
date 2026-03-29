import 'package:job_tracker/core/enums/application_status.dart';
import 'package:job_tracker/core/enums/interview_result.dart';

class JobApplication {
  final String id;
  final String companyName;
  final String source;
  final DateTime appliedDate;
  final ApplicationStatus status;
  final String? jobUrl;
  final String? companyEmail;
  final String? hrName;
  final String? hrLinkedInUrl;
  final DateTime? interviewDate;
  final InterviewResult? interviewResult;

  const JobApplication({
    required this.id,
    required this.companyName,
    required this.source,
    required this.appliedDate,
    required this.status,
    this.jobUrl,
    this.companyEmail,
    this.hrName,
    this.hrLinkedInUrl,
    this.interviewDate,
    this.interviewResult,
  });

  JobApplication copyWith({
    String? id,
    String? companyName,
    String? source,
    DateTime? appliedDate,
    ApplicationStatus? status,
    String? jobUrl,
    String? companyEmail,
    String? hrName,
    String? hrLinkedInUrl,
    DateTime? interviewDate,
    InterviewResult? interviewResult,
  }) {
    return JobApplication(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      source: source ?? this.source,
      appliedDate: appliedDate ?? this.appliedDate,
      status: status ?? this.status,
      jobUrl: jobUrl ?? this.jobUrl,
      companyEmail: companyEmail ?? this.companyEmail,
      hrName: hrName ?? this.hrName,
      hrLinkedInUrl: hrLinkedInUrl ?? this.hrLinkedInUrl,
      interviewDate: interviewDate ?? this.interviewDate,
      interviewResult: interviewResult ?? this.interviewResult,
    );
  }
}
