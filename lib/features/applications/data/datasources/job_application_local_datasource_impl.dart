import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/data/datasources/job_application_local_datasource.dart';
import 'package:job_tracker/features/applications/data/models/job_application_model.dart';

class JobApplicationLocalDatasourceImpl
    implements JobApplicationLocalDatasource {
  final Box<JobApplicationModel> box;

  JobApplicationLocalDatasourceImpl(this.box);

  @override
  Future<Result<void>> addApplication(JobApplicationModel model) async {
    try {
      await box.put(model.modelId, model);
      return Success(null);
    } catch (e) {
      return Failure("Failed to add application");
    }
  }

  @override
  Future<Result<void>> deleteApplication(String id) async {
    try {
      await box.delete(id);
      return Success(null);
    } catch (e) {
      return Failure("Failed to delete application");
    }
  }

  @override
  Future<Result<List<JobApplicationModel>>> getAllApplications() async {
    try {
      final application = box.values.toList();
      return Success(application);
    } catch (e) {
      return Failure("Failed to get applications");
    }
  }

  @override
  Future<Result<void>> updateApplication(JobApplicationModel model) async {
    try {
      await box.put(model.modelId, model);
      return Success(null);
    } catch (e) {
      return Failure("Failed to update application");
    }
  }
}
