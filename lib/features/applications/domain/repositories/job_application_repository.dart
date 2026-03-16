import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';

abstract interface class JobApplicationRepository {
  Future<Result<List<JobApplication>>> getAllApplications();
  Future<Result<JobApplication>> getApplicationById(String id);
  Future<Result<void>> addApplication(JobApplication application);
  Future<Result<void>> updateApplication(JobApplication application);
  Future<Result<void>> deleteApplication(String id);
}
