

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/login/model/login_resp_model.dart';

abstract class LoginState extends Equatable{

}

class LoginInitialState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState{
  LoginResponseModel? loginResponseModel;
  LoginLoadedState({this.loginResponseModel});

  @override
  List<Object?> get props => [loginResponseModel];
}

class LoginErrorState extends LoginState{
  String? errorMag;
  LoginErrorState({required this.errorMag});
  @override
  List<Object?> get props => [errorMag];
}