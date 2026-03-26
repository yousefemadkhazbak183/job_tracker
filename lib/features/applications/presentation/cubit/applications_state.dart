import 'package:job_tracker/features/applications/domain/entities/job_application.dart';

sealed class ApplicationsState {
  const ApplicationsState();
}

final class ApplicationsInitial extends ApplicationsState {
  const ApplicationsInitial();
}

final class ApplicationsLoading extends ApplicationsState {
  const ApplicationsLoading();
}

final class ApplicationsSuccess extends ApplicationsState {
  final List<JobApplication> applications;
  const ApplicationsSuccess(this.applications);
}

final class ApplicationsFailure extends ApplicationsState {
  final String message;
  const ApplicationsFailure(this.message);
}
