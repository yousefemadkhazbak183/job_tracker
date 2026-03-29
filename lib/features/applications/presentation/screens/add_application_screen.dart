import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_tracker/core/enums/application_status.dart';
import 'package:job_tracker/core/extensions/context_extensions.dart';
import 'package:job_tracker/core/theme/app_colors.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/presentation/cubit/applications_cubit.dart';
import 'package:job_tracker/features/applications/presentation/widgets/custom_text_field.dart';
import 'package:job_tracker/features/applications/presentation/widgets/source_dropdown.dart';

class AddApplicationScreen extends StatefulWidget {
  const AddApplicationScreen({super.key});

  @override
  State<AddApplicationScreen> createState() => _AddApplicationScreenState();
}

class _AddApplicationScreenState extends State<AddApplicationScreen> {
  final _companyController = TextEditingController();
  final _jobUrlController = TextEditingController();
  final _emailController = TextEditingController();
  final _hrNameController = TextEditingController();
  final _hrLinkedInController = TextEditingController();
  String? _selectedSource;

  @override
  void dispose() {
    _companyController.dispose();
    _jobUrlController.dispose();
    _emailController.dispose();
    _hrNameController.dispose();
    _hrLinkedInController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _companyController.text.trim().isNotEmpty && _selectedSource != null;

  Future<void> _submit() async {
    if (!_isValid) {
      context.showSnackBar('Please fill in required fields');
      return;
    }

    final application = JobApplication(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      companyName: _companyController.text.trim(),
      source: _selectedSource!,
      appliedDate: DateTime.now(),
      status: ApplicationStatus.noReply,
      jobUrl: _jobUrlController.text.trim().isEmpty
          ? null
          : _jobUrlController.text.trim(),
      companyEmail: _emailController.text.trim().isEmpty
          ? null
          : _emailController.text.trim(),
      hrName: _hrNameController.text.trim().isEmpty
          ? null
          : _hrNameController.text.trim(),
      hrLinkedInUrl: _hrLinkedInController.text.trim().isEmpty
          ? null
          : _hrLinkedInController.text.trim(),
    );

    await context.read<ApplicationsCubit>().addApplication(application);

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Application')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              label: 'Company Name',
              hint: 'Vodafone Egypt',
              controller: _companyController,
              isRequired: true,
            ),
            const SizedBox(height: 12),
            SourceDropdown(
              selectedSource: _selectedSource,
              onChanged: (value) => setState(() => _selectedSource = value),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Job URL',
              hint: 'linkedin.com/jobs/...',
              controller: _jobUrlController,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Company Email',
              hint: 'hr@company.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'HR Name',
              hint: 'Sara Ahmed',
              controller: _hrNameController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'HR LinkedIn',
              hint: 'linkedin.com/in/...',
              controller: _hrLinkedInController,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
