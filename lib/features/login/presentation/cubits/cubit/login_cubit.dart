import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:resupply_ai/features/login/data/repo/login_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String cageCode, required String password}) async {
    emit(LoginLoading());
    var response = await LoginRepoImpl().login(cageCode, password);
    print(response);
    response.fold(
      (failure) {
        print(failure.errorMessage);
        emit(LoginFailure(failure.errorMessage));
      },
      (success) {
        emit(LoginSuccess());
      },
    );
  }

  saveCageCode(String cageCode) async {
    var box = await Hive.box('cageCodeBox');
    box.put('cageCode', cageCode);
    emit(LoginSaveCageCodeState(cageCode));
  }
}
