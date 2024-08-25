import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_event.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_state.dart';
import 'package:flutter_bloc_tutorial/login/model/login_resp_model.dart';
import 'package:flutter_bloc_tutorial/login/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        LoginResponseModel loginResponseModel = await LoginRepo().login(
            event.loginReqModel?.username ?? "",
            event.loginReqModel?.password ?? "");

        emit(LoginLoadedState(loginResponseModel: loginResponseModel));
      } catch (e) {
        emit(LoginErrorState(errorMag: e.toString()));
      }
    });
  }
}
