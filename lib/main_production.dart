import 'package:flutter/material.dart';

import 'core/Routing/app_router.dart';
import 'core/di/dependacy_injection.dart';
import 'doc_doc_app.dart';

void main() {
  setupGetIt();
  runApp( DocDocApp(appRouter: AppRouter(),));
}