import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/domain/repositories/job_application_repository.dart';

class GetAllApplications {
  final JobApplicationRepository repository;

  GetAllApplications(this.repository);

  Future<Result<List<JobApplication>>> call() {
    return repository.getAllApplications();
  }
}
