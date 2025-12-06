import 'package:dartz/dartz.dart';
import 'package:resupply_ai/core/errors/failure.dart';
import 'package:resupply_ai/features/login/data/models/login_response_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponseModel>> login(String cageCode, String password);
}
