import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/domain/repositories/job_application_repository.dart';

class AddApplication {
  final JobApplicationRepository repository;

  AddApplication(this.repository);

  Future<Result<void>> call(JobApplication application) {
    return repository.addApplication(application);
  }
}
