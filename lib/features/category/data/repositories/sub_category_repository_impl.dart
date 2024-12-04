import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/data/data_source/sub_category_remote_data_source.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/repositories/sub_category_repository.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final SubCategoryRemoteDataSource remoteDataSource;

  SubCategoryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Category>>> getSubCategories(
      {required int categoryId}) async {
    try {
      final response =
          await remoteDataSource.getSubCategories(categoryId: categoryId);
      final subCategories = response.map((e) => e.toDomain()).toList();
      return Right(subCategories);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
