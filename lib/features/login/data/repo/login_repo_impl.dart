import 'package:dartz/dartz.dart';
import 'package:resupply_ai/core/errors/failure.dart';
import 'package:resupply_ai/core/networking/api_service.dart';
import 'package:resupply_ai/features/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, List<dynamic>>> login(
      String cageCode, String password) async {
    try {
      final response = await apiService.get(
        'https://interdig.org/appdata.cfm?cage=$cageCode&password=$password',
      );
      if (response[0]['answer'].toString() == 'yes') {
        print(response);

        return Right(response);
      } else {
        return Left(Failure(errorMessage: 'wrong cage code or password'));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
