import 'package:dartz/dartz.dart';
import 'package:resupply_ai/core/errors/failure.dart';
import 'package:resupply_ai/core/networking/api_service.dart';
import 'package:resupply_ai/features/home/data/models/main_details_model.dart';
import 'package:resupply_ai/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, List<dynamic>>> getAllDetails({
    required String url,
    String? searchValue,
  }) async {
    try {
      final response = await apiService.get(
        url,
        queryParameters: {
          'nn': 1,
          'var': searchValue ?? '',
        },
      );
      print(response);
      return Right(response);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, MainDetailsResponse>> getAllQuote(
      {required String url, String? searchValue}) async {
    try {
      var response = await apiService.get(
        url,
      );
      return Right(MainDetailsResponse.fromJson(response));
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
