
import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';
import '../../../../core/error/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, DealsEntity>> getAvaliableDealsListUseCase({required DealParameter dealParameter});
  Future<Either<Failure, DealsEntity>> getMyDealsListUseCase({required DealParameter dealParameter});

}