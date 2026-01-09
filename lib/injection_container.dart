import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> init() async {
  getIt.init();
}
