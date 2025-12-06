import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resupply_ai/core/errors/failure.dart';
import 'package:resupply_ai/core/networking/api_service.dart';
import 'package:resupply_ai/core/services/shared_pref_service.dart';
import 'package:resupply_ai/features/login/data/models/login_response_model.dart';
import 'package:resupply_ai/features/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      String cageCode, String password) async {
    try {
      final response = await apiService.get(
        'https://interdig.org/appdata.cfm?cage=$cageCode&password=$password',
      );
      print(response);
      if (response[0]['answer'].toString() == 'yes') {
        // savae user data
        await Hive.box<LoginResponseModel>('userBox')
            .put('user', LoginResponseModel.fromJson(response));
        return Right(LoginResponseModel.fromJson(response));
      } else {
        return Left(Failure(errorMessage: 'wrong cage code or password'));
      }
    } catch (e) {
      return Left(Failure(errorMessage: 'Something went wrong'));
    }
  }
}
