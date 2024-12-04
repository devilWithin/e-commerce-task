import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
