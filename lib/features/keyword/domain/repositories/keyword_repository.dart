import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';

abstract class KeywordRepository {
  Future<Either<Failure, List<Keyword>>> getKeywordsByCategoryIdUseCase({
    required int categoryId,
  });
}
