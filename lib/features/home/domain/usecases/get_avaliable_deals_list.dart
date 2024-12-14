
import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';
import 'package:qubeCommerce/features/home/domain/repositories/home_repository.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetAvaliableDealsListUseCase
    implements UseCase< DealsEntity,DealParameter> {
  final HomeRepository homeRepository;

  GetAvaliableDealsListUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, DealsEntity>> call(
          DealParameter params) =>
      homeRepository.getAvaliableDealsListUseCase(dealParameter: params);
}
