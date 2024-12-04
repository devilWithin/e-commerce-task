import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/addon/data/data_source/addon_remote_data_source.dart';
import 'package:fudex_test/features/addon/data/models/addon_model.dart';
import 'package:fudex_test/features/addon/domain/entities/addon.dart';
import 'package:fudex_test/features/addon/domain/repositories/addon_repository.dart';

class AddonRepositoryImpl implements AddonRepository {
  final AddonRemoteDataSource _remoteDataSource;

  AddonRepositoryImpl({required AddonRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Addon>>> getAddonsBySubcategoryId({
    required int subcategoryId,
  }) async {
    try {
      final response = await _remoteDataSource.getAddonsBySubCategoryId(
          subCategoryId: subcategoryId);
      final result = response.map((e) => e.toDomain()).toList();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
