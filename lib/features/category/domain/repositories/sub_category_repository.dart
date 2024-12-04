import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';

abstract class SubCategoryRepository {
  Future<Either<Failure, List<Category>>> getSubCategories(
      {required int categoryId});
}
