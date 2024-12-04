import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/repositories/category_repository.dart';

class GetCategoriesUseCase extends UseCase<List<Category>, NoParams> {
  final CategoryRepository _repository;

  GetCategoriesUseCase({required CategoryRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
