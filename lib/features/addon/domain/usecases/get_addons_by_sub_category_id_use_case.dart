import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/addon/domain/entities/addon.dart';
import 'package:fudex_test/features/addon/domain/repositories/addon_repository.dart';

class GetAddonsBySubCategoryIdUseCase extends UseCase<List<Addon>, int> {
  final AddonRepository _repository;

  GetAddonsBySubCategoryIdUseCase({required AddonRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Addon>>> call(int params) {
    return _repository.getAddonsBySubcategoryId(subcategoryId: params);
  }
}
