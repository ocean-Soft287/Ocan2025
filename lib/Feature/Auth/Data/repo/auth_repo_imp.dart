import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/Data/repo/auth_repo.dart';
import '../../../../core/Failure/failure.dart';
import '../../../../core/Network/remote/encrupt.dart';
import '../../../../core/utils/api/endPoint.dart';
import '../../../../core/utils/api/dio_consumer.dart';

class LoginRepoImp implements Loginrepo {
  final DioConsumer dioConsumer;

  LoginRepoImp({required this.dioConsumer});

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> login({
    required String customerPhone,
    required String passWord,
  }) async {
    try {
      final response = await dioConsumer.get(
        "${EndPoint.login}?CustomerPhone=$customerPhone&passWord=$passWord",
      );
      if (response == null || response.toString().isEmpty) {
        return left(const ServerFailure("Empty response from server"));
      }
      if (response == "RPi7E8lPAc8isPtdZ1vocw==") return right({});
      final decryptedText = decrypt(response.toString(), privateKey, publicKey);
      return right(jsonDecode(decryptedText));
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(ServerFailure("Failed to login: ${e.toString()}"));
    }
  }

  ServerFailure _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      if (statusCode == 401) {
        return ServerFailure(
          "Unauthorized: ${responseData['message'] ?? 'Invalid credentials'}",
        );
      }
      return ServerFailure(
        "Request failed: ${responseData['message'] ?? 'Unknown error'}",
      );
    } else {
      return ServerFailure("Network error: ${e.message}");
    }
  }
}
