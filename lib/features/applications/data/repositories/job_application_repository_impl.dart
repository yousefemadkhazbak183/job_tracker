import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/data/datasources/job_application_local_datasource.dart';
import 'package:job_tracker/features/applications/data/models/job_application_model.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/domain/repositories/job_application_repository.dart';

class JobApplicationRepositoryImpl implements JobApplicationRepository {
  final JobApplicationLocalDatasource localDatasource;

  JobApplicationRepositoryImpl(this.localDatasource);
  @override
  Future<Result<void>> addApplication(JobApplication application) {
    final model = JobApplicationModel.fromEntity(application);
    return localDatasource.addApplication(model);
  }

  @override
  Future<Result<void>> deleteApplication(String id) {
    return localDatasource.deleteApplication(id);
  }

  @override
  Future<Result<List<JobApplication>>> getAllApplications() {
    return localDatasource.getAllApplications();
  }

  @override
  Future<Result<JobApplication>> getApplicationById(String id) async {
    final result = await localDatasource.getAllApplications();
    return switch (result) {
      Success(:final data) => switch (data
          .where((e) => e.id == id)
          .firstOrNull) {
        null => Failure('Application not found'),
        final app => Success(app),
      },
      Failure(:final message) => Failure(message),
    };
  }

  @override
  Future<Result<void>> updateApplication(JobApplication application) {
    final model = JobApplicationModel.fromEntity(application);
    return localDatasource.updateApplication(model);
  }
}
