

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/login/model/login_req_model.dart';

abstract class LoginEvent extends Equatable{

}

class LoginReqEvent extends LoginEvent{
  LoginReqModel? loginReqModel;
  LoginReqEvent({required this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}