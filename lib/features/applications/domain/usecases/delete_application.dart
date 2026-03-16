import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/domain/repositories/job_application_repository.dart';

class DeleteApplication {
  final JobApplicationRepository repository;

  DeleteApplication(this.repository);

  Future<Result<void>> call(String id) {
    return repository.deleteApplication(id);
  }
}
