import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model_adapter.dart';
import 'package:techfis_asset_management_mobile/core/config/router.dart';
import 'package:techfis_asset_management_mobile/core/config/theme.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techfis_asset_management_mobile/injection_container.dart' as di;

import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/language_bloc.dart';
import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/theme_bloc.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:techfis_asset_management_mobile/core/error/global_error_handler.dart';

void main() async {
  await GlobalErrorHandler.initialize(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter();
      Hive.registerAdapter(AssetModelAdapter());

      await di.init();

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory(),
      );

      runApp(const MyApp());
    },
    // TODO: Replace with your actual Sentry DSN
    dsn: 'https://examplePublicKey@o0.ingest.sentry.io/0',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.getIt<AuthBloc>()..add(AuthCheckStatusRequested()),
        ),
        BlocProvider(
          create: (_) => di.getIt<LanguageBloc>()..add(LanguageLoadRequested()),
        ),
        BlocProvider(
          create: (_) => di.getIt<ThemeBloc>()..add(const ThemeEvent.started()),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                title: 'Techfis Asset Management',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('vi'),
                  Locale('ja'),
                ],
                locale: languageState.locale,
              );
            },
          );
        },
      ),
    );
  }
}
