import 'dart:async';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';

import 'package:sync_track_for_git/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      // 에러 로깅
      print('Flutter Error: ${details.exception}');
      print('Stack trace: ${details.stack}');
    };

    WidgetsFlutterBinding.ensureInitialized();

    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitle('Sync Track for Git');
    });

    runApp(
      const App(),
      // MultiProvider(
      //   providers: [],
      //   child: const App(),
      // ),
    );
  }, (error, stackTrace) {
    // Zone 내에서 발생하는 모든 에러 로깅
    print('Caught error: $error');
    print('Stack trace: $stackTrace');
  });
}
