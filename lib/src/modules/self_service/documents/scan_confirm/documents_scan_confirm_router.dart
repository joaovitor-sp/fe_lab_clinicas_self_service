import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository_impl.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter/material.dart';

class DocumentsScanConfirmRouter extends FlutterGetItModulePageRouter {
  const DocumentsScanConfirmRouter({super.key});

  @override
  // TODO: implement bindings
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => DocumentsScanConfirmController(documentsRepository: i())),
        Bind.lazySingleton<DocumentsRepository>(
            (i) => DocumentsRepositoryImpl(restClient: i())),
      ];

  @override
  // TODO: implement view
  WidgetBuilder get view => (_) => DocumentsScanConfirmPage();
}
