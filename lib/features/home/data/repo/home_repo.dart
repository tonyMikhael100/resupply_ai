import 'package:dartz/dartz.dart';
import 'package:resupply_ai/core/errors/failure.dart';
import 'package:resupply_ai/features/home/data/models/main_details_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<dynamic>>> getAllDetails({
    String? searchValue,
    required String url,
  });
}
