import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({
    required PatientsRepository patientsRepository,
  }) : _patientsRepository = patientsRepository;

  final PatientsRepository _patientsRepository;

  final _patientsNotFound = ValueSignal<bool?>(null);
  bool? get patientsNotFound => _patientsNotFound();

  final _patient = ValueSignal<PatientModel?>(null);
  PatientModel? get patient => _patient();

  Future<void> findPatientsByDocument(String document) async {
    final patientsResult =
        await _patientsRepository.findPatientByDocument(document);

    bool patientsNotFound;
    PatientModel? patient;

    switch (patientsResult) {
      case Right(value: PatientModel model?):
        patientsNotFound = false;
        patient = model;
      case Right(value: _):
        patientsNotFound = true;
        patient = null;
      case Left():
        showError('Erro ao buscar paciente');
        return;
    }

    batch(() {
      _patient.value = patient;
      _patientsNotFound.forceUpdate(patientsNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientsNotFound.forceUpdate(true);
    });
  }
}
