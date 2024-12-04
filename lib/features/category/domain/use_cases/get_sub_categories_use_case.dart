import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/repositories/sub_category_repository.dart';

class GetSubCategoriesUseCase extends UseCase<List<Category>, int> {
  final SubCategoryRepository _repository;

  GetSubCategoriesUseCase({required SubCategoryRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Category>>> call(int params) async {
    return await _repository.getSubCategories(categoryId: params);
  }
}
