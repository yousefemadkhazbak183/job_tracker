import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_tracker/core/service_locator.dart';
import 'package:job_tracker/features/applications/presentation/cubit/applications_cubit.dart';
import 'package:job_tracker/features/applications/presentation/widgets/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ApplicationsCubit>()..loadApplications(),
      child: const HomeView(),
    );
  }
}
