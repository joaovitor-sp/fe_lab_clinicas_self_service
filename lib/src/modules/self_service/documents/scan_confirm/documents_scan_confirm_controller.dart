// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  DocumentsScanConfirmController({
    required this.documentsRepository,
  });
  final pathRemoteStorage = signal<String?>(null);

  final DocumentsRepository documentsRepository;

  Future<void> uploadImage(Uint8List imageBytes, String fileName) async {
    final result = await documentsRepository
        .uploadImage(imageBytes, fileName)
        .asyncLoader();

    switch (result) {
      case Left():
        showError('Erro ao fazer upload de imagem');
      case Right(value: final pathFile):
        pathRemoteStorage.value = pathFile;
    }
  }
}
