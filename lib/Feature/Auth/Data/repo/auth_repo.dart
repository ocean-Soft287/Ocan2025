import '../../../../core/Failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Loginrepo {
  Future<Either<Failure, Map<String, dynamic>>> login({required String customerPhone, required String passWord,});
}