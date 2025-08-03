import 'package:bloc/bloc.dart';
import '../../../../core/Network/local/flutter_secure_storage.dart';
import '../../Data/model/customer_model.dart';
import '../../Data/repo/auth_repo.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginrepo) : super(LoginInitial());
  final Loginrepo loginrepo;

  void userLogin({
    required String customerPhone,
    required String password,
  }) async {
    emit(LoginViewStateLoading());
    final response = await loginrepo.login(
      customerPhone: customerPhone,
      passWord: password,
    );

    response.fold(
          (failure) {
        emit(LoginViewStateError(failure.message));
      },
          (data) {
        if (data.isEmpty) {
          emit(LoginViewStateError("Invalid credentials"));
        } else {
          final Customer customer = Customer.fromJson(data);

          SecureStorageService.write(
            SecureStorageService.mobile,
            customer.customerPhone.toString(),
          );

          emit(LoginViewStateSuccess(customer));
        }
      },
    );
  }
}
