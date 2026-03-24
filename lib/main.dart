import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:job_tracker/core/constants/app_constants.dart';
import 'package:job_tracker/core/service_locator.dart';
import 'package:job_tracker/core/theme/app_theme.dart';
import 'package:job_tracker/features/applications/data/models/job_application_model.dart';
import 'package:job_tracker/features/applications/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JobApplicationModelAdapter());
  await Hive.openBox<JobApplicationModel>(AppConstants.databaseName);

  await setupServiceLocator();
  runApp(const JobTrackerApp());
}

class JobTrackerApp extends StatelessWidget {
  const JobTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
