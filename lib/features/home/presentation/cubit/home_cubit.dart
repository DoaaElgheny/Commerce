import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/home/data/models/deal_model.dart';
import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/map_failure_msg.dart';
import '../../domain/usecases/get_avaliable_deals_list.dart';
import '../../domain/usecases/get_my_deals_list.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  final GetAvaliableDealsListUseCase getAvaliableDealsListUseCase;
  final GetMyDealsListUseCase getMyDealsListUseCase;


  HomeCubit({required this.getAvaliableDealsListUseCase,
   required this.getMyDealsListUseCase}) : super(HomeState(
    avaliableDealsList: null, myDealsList: null,
  ));

  Future<void> getAvaliabledeals(DealParameter param) async {
    try {
      Either<Failure,DealsEntity> response =
      await getAvaliableDealsListUseCase(param);
      response.fold((failure) {
        MapFailureToMsg.mapFailureToMsg(failure);
      }, (avaliableDealsList) {
        emit(state.copyWith(avaliableDealsList: avaliableDealsList));
      });
    } catch (error) {
      emit(state.copyWith(avaliableDealsList: null));
    }
  }
  Future<void> getMyDeals(DealParameter param) async {
        try {
      Either<Failure, DealsEntity> response =
      await getMyDealsListUseCase(param);
      response.fold((failure) {
        MapFailureToMsg.mapFailureToMsg(failure);
      }, (myDealsList) {
        emit(state.copyWith(myDealsList: myDealsList));
      });
    } catch (error) {
      emit(state.copyWith(myDealsList: null));
    }
  }

}