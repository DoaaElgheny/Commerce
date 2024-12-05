// import 'package:ceevezapp/features/home/data/models/classification_list_model.dart';
// import 'package:dartz/dartz.dart';
// import '../../../../core/error/Failure.dart';
// import '../../../../core/error/exceptions.dart';
// import '../../domain/entities/search_jobs_list.dart';
// import '../../domain/repositories/home_repository.dart';
// import '../datasources/home_remote_data_source.dart';
//
//
// class HomeRepositoryImpl implements HomeRepository {
//   final HomeRemoteDataSource homeRemoteDataSource;
//
//   HomeRepositoryImpl({
//     required this.homeRemoteDataSource,
//   });
//
//   @override
//   Future<Either<Failure, List<ClassificationListModel>>> getClassificationList() async {
//     try {
//       final classificationList = await homeRemoteDataSource.getClassificationList();
//       return Right(classificationList);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   @override
//   Future<Either<Failure, SearchJobsList>> getRecentJobsList() async {
//     try {
//       final recentJobsList = await homeRemoteDataSource.getRecentJobsList();
//       return Right(recentJobsList);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
// }
