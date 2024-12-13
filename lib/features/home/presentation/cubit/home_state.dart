
import 'package:qubeCommerce/features/home/data/models/deal_model.dart';
import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';

class HomeState {
  DealsEntity? avaliableDealsList;
  DealsEntity? myDealsList;

  HomeState({
    required this.avaliableDealsList,
    required this.myDealsList,

  });

  HomeState copyWith({
    DealsEntity? avaliableDealsList,
    DealsEntity? myDealsList,

  }) {
    return HomeState(
      avaliableDealsList: avaliableDealsList ?? this.avaliableDealsList,
      myDealsList: myDealsList ?? this.myDealsList,
  
    );
  }
}
