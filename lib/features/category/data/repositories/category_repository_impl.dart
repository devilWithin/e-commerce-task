import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/data/data_source/category_remote_data_source.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;

  CategoryRepositoryImpl({required CategoryRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories.map((category) => category.toDomain()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
