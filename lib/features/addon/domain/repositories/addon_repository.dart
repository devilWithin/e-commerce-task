import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/addon/domain/entities/addon.dart';

abstract class AddonRepository {
  Future<Either<Failure, List<Addon>>> getAddonsBySubcategoryId(
      {required int subcategoryId});
}
