import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';
import 'package:fudex_test/features/keyword/domain/repositories/keyword_repository.dart';

class GetKeywordsByCategoryIdUseCase extends UseCase<List<Keyword>, int> {
  final KeywordRepository _repository;

  GetKeywordsByCategoryIdUseCase({required KeywordRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Keyword>>> call(int params) async {
    return await _repository.getKeywordsByCategoryIdUseCase(categoryId: params);
  }
}
