import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ErrorTranslation on BuildContext {
  String translateError(String message) {
    final l10n = AppLocalizations.of(this)!;
    switch (message) {
      case 'failedToLoadAssets':
        return l10n.failedToLoadAssets;
      case 'failedToLoadAssetDetails':
        return l10n.failedToLoadAssetDetails;
      case 'connectionTimedOut':
        return l10n.connectionTimedOut;
      case 'serverError':
        return l10n.serverError;
      case 'noInternetConnection':
        return l10n.noInternetConnection;
      case 'requestCancelled':
        return l10n.requestCancelled;
      case 'unknownError':
        return l10n.unknownError;
      case 'unauthorized':
        return l10n.unauthorized;
      case 'forbidden':
        return l10n.forbidden;
      case 'badRequest':
        return l10n.badRequest;
      default:
        // Attempt to see if the message itself is a key or just return as is
        return message;
    }
  }
}
