import 'package:techfis_asset_management_mobile/injection_container.config.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model.dart';
import 'package:techfis_asset_management_mobile/core/network/auth_interceptor.dart';
import 'package:techfis_asset_management_mobile/core/network/dio_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.createInstance();

  @Named('assetBox')
  @preResolve
  @lazySingleton
  Future<Box<AssetModel>> get assetBox async =>
      await Hive.openBox<AssetModel>('assets_box');
}
