import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentBoxWidget extends StatelessWidget {
  const DocumentBoxWidget({
    super.key,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
    this.onTap,
  });

  final Widget icon;
  final bool uploaded;
  final String label;
  final int totalFiles;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            children: [
              Expanded(child: icon),
              Text(
                '$label $totalFilesLabel',
                style: const TextStyle(
                    fontSize: 14,
                    color: LabClinicasTheme.orangeColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
