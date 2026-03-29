import 'package:flutter/material.dart';
import 'package:job_tracker/core/theme/app_colors.dart';

class SourceDropdown extends StatelessWidget {
  final String? selectedSource;
  final ValueChanged<String?> onChanged;

  const SourceDropdown({
    super.key,
    required this.selectedSource,
    required this.onChanged,
  });

  static const List<String> sources = [
    'LinkedIn',
    'Wuzzuf',
    'Forasna',
    'Bayt',
    'Email',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Source',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            Text(' *', style: TextStyle(fontSize: 11, color: Colors.red)),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          initialValue: selectedSource,
          hint: const Text(
            'Select source',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
          items: sources
              .map(
                (source) =>
                    DropdownMenuItem(value: source, child: Text(source)),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
