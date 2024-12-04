import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/keyword/data/data_source/keyword_remote_data_source.dart';
import 'package:fudex_test/features/keyword/data/models/keyword_model.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';
import 'package:fudex_test/features/keyword/domain/repositories/keyword_repository.dart';

class KeywordRepositoryImpl implements KeywordRepository {
  final KeywordRemoteDataSource _remoteDataSource;

  KeywordRepositoryImpl({required KeywordRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Keyword>>> getKeywordsByCategoryIdUseCase({
    required int categoryId,
  }) async {
    try {
      final response = await _remoteDataSource.getKeywordsByCategoryIdUseCase(
          categoryId: categoryId);
      final keywords = response.map((keyword) => keyword.toDomain()).toList();
      return Right(keywords);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
