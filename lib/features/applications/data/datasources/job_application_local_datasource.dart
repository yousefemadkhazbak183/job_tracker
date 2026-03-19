import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/data/models/job_application_model.dart';

abstract interface class JobApplicationLocalDatasource {
  Future<Result<List<JobApplicationModel>>> getAllApplications();
  Future<Result<void>> addApplication(JobApplicationModel model);
  Future<Result<void>> updateApplication(JobApplicationModel model);
  Future<Result<void>> deleteApplication(String id);
}
