import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

class GlobalErrorHandler {
  static Future<void> initialize(
    FutureOr<void> Function() runner, {
    required String dsn,
  }) async {
    await SentryFlutter.init(
      (options) {
        options.dsn = dsn;
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0; // Captures performance profiles
        options.environment = kReleaseMode ? 'production' : 'debug';
      },
      appRunner: () => _runZoned(runner),
    );
  }

  static Future<void> _runZoned(FutureOr<void> Function() runner) async {
    runZonedGuarded(
      () async {
        FlutterError.onError = (FlutterErrorDetails details) {
          FlutterError.presentError(details);
          _reportError(details.exception, details.stack, 'FlutterError');
        };

        PlatformDispatcher.instance.onError = (error, stack) {
          _reportError(error, stack, 'PlatformDispatcher');
          return true;
        };

        await runner();
      },
      (error, stack) {
        _reportError(error, stack, 'ZonedGuarded');
      },
    );
  }

  static Future<void> _reportError(
      dynamic error, StackTrace? stack, String context) async {
    if (kDebugMode) {
      debugPrint('[$context] Caught error: $error');
      if (stack != null) debugPrint(stack.toString());
    }

    try {
      await Sentry.captureException(
        error,
        stackTrace: stack,
        withScope: (scope) {
          scope.setTag('context', context);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Failed to report error to Sentry: $e');
      }
    }
  }

  /// Manually report an error
  static void report(dynamic error, [StackTrace? stack]) {
    _reportError(error, stack, 'ManualReport');
  }
}
