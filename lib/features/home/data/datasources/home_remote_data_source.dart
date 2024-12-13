
// import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
// import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';

// import '../../../../core/api/api_consumer.dart';

// abstract class HomeRemoteDataSource {
//   Future<DealsEntity> get(
//       {required DealParameter dealParameter});

//   Future<DealsEntity> getExperienceTypeHome(
//       {required DealsEntity vacationHomeParameter});
// }

// class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
//   ApiConsumer apiConsumer;

//   HomeRemoteDataSourceImpl({required this.apiConsumer});

//   @override
//   Future<ExperienceTypeLookupEntity> getExperienceTypeHome(
//       {required VacationHomeParameter vacationHomeParameter}) async {
//     final response = await apiConsumer.get(EndPoints.getExperienceTypeLookup,
//         isToken: false, queryParameters: vacationHomeParameter.toJson());
//     return ExperienceTypeLookupEntity.fromJson(response);
//   }

//   @override
//   Future<VacationHomeTypesEntity> getVacationTypeHome(
//       {required VacationHomeParameter vacationHomeParameter}) async {
//     final response = await apiConsumer.get(EndPoints.getVacationHomeTypes,
//         isToken: false, queryParameters: vacationHomeParameter.toJson());
//     return VacationHomeTypesEntity.fromJson(response);
//   }
// }
