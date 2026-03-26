import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_tracker/core/errors/result.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/domain/usecases/add_application.dart';
import 'package:job_tracker/features/applications/domain/usecases/delete_application.dart';
import 'package:job_tracker/features/applications/domain/usecases/get_all_applications.dart';
import 'package:job_tracker/features/applications/domain/usecases/update_application.dart';
import 'package:job_tracker/features/applications/presentation/cubit/applications_state.dart';

class ApplicationsCubit extends Cubit<ApplicationsState> {
  final GetAllApplications _getAllApplications;
  final AddApplication _addApplication;
  final UpdateApplication _updateApplication;
  final DeleteApplication _deleteApplication;

  ApplicationsCubit({
    required GetAllApplications getAllApplications,
    required AddApplication addApplication,
    required UpdateApplication updateApplication,
    required DeleteApplication deleteApplication,
  }) : _getAllApplications = getAllApplications,
       _addApplication = addApplication,
       _updateApplication = updateApplication,
       _deleteApplication = deleteApplication,
       super(const ApplicationsInitial());

  Future<void> loadApplications() async {
    emit(ApplicationsLoading());

    final result = await _getAllApplications();

    switch (result) {
      case Success(:final data):
        emit(ApplicationsSuccess(data));
      case Failure(:final message):
        emit(ApplicationsFailure(message));
    }
  }

  Future<void> addApplication(JobApplication application) async {
    final result = await _addApplication(application);
    switch (result) {
      case Success():
        await loadApplications();
      case Failure(:final message):
        emit(ApplicationsFailure(message));
    }
  }

  Future<void> updateApplication(JobApplication application) async {
    final result = await _updateApplication(application);
    switch (result) {
      case Success():
        await loadApplications();
      case Failure(:final message):
        emit(ApplicationsFailure(message));
    }
  }

  Future<void> deleteApplication(String id) async {
    final result = await _deleteApplication(id);
    switch (result) {
      case Success():
        await loadApplications();
      case Failure(:final message):
        emit(ApplicationsFailure(message));
    }
  }
}
