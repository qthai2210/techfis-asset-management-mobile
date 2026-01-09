import 'package:dartz/dartz.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
