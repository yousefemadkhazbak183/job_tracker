import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:job_tracker/core/constants/app_constants.dart';
import 'package:job_tracker/features/applications/data/datasources/job_application_local_datasource.dart';
import 'package:job_tracker/features/applications/data/datasources/job_application_local_datasource_impl.dart';

import 'package:job_tracker/features/applications/data/models/job_application_model.dart';
import 'package:job_tracker/features/applications/data/repositories/job_application_repository_impl.dart';
import 'package:job_tracker/features/applications/domain/repositories/job_application_repository.dart';
import 'package:job_tracker/features/applications/domain/usecases/add_application.dart';
import 'package:job_tracker/features/applications/domain/usecases/delete_application.dart';
import 'package:job_tracker/features/applications/domain/usecases/get_all_applications.dart';
import 'package:job_tracker/features/applications/domain/usecases/update_application.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final box = Hive.box<JobApplicationModel>(AppConstants.databaseName);

  getIt.registerSingleton<JobApplicationLocalDatasource>(
    JobApplicationLocalDatasourceImpl(box),
  );

  getIt.registerSingleton<JobApplicationRepository>(
    JobApplicationRepositoryImpl(getIt<JobApplicationLocalDatasource>()),
  );

  getIt.registerSingleton<GetAllApplications>(
    GetAllApplications(getIt<JobApplicationRepository>()),
  );

  getIt.registerSingleton<AddApplication>(
    AddApplication(getIt<JobApplicationRepository>()),
  );

  getIt.registerSingleton<UpdateApplication>(
    UpdateApplication(getIt<JobApplicationRepository>()),
  );

  getIt.registerSingleton<DeleteApplication>(
    DeleteApplication(getIt<JobApplicationRepository>()),
  );
}
