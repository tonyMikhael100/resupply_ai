import 'package:dartz/dartz.dart';
import 'package:resupply_ai/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, List<dynamic>>> login(
      String cageCode, String password);
}
