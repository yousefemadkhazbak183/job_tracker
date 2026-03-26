import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_tracker/core/theme/app_colors.dart';
import 'package:job_tracker/features/applications/presentation/cubit/applications_cubit.dart';
import 'package:job_tracker/features/applications/presentation/cubit/applications_state.dart';
import 'package:job_tracker/features/applications/presentation/widgets/application_card.dart';
import 'package:job_tracker/features/applications/presentation/widgets/card_state.dart';
import 'package:job_tracker/features/applications/presentation/widgets/home_shimmer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Applications')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<ApplicationsCubit, ApplicationsState>(
        builder: (context, state) {
          return switch (state) {
            ApplicationsInitial() => const SizedBox(),
            ApplicationsLoading() => const HomeShimmer(),
            ApplicationsFailure(:final message) => Center(child: Text(message)),
            ApplicationsSuccess(:final applications) =>
              applications.isEmpty
                  ? const Center(child: Text('No applications yet'))
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CardState(applications: applications),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.separated(
                              itemCount: applications.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) => ApplicationCard(
                                application: applications[index],
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
          };
        },
      ),
    );
  }
}
