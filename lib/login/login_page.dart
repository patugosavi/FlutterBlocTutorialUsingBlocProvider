import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_event.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_state.dart';
import 'package:flutter_bloc_tutorial/login/model/login_req_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context,state){
          if(state is LoginInitialState){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var bloc=BlocProvider.of<LoginBloc>(context);
                      var req=LoginReqModel(username: userNameController.text,password: passwordController.text);

                      bloc.add(LoginReqEvent(loginReqModel: req));
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            );
          }else if(state is LoginLoadingState){
            return CircularProgressIndicator();
          }else if(state is LoginLoadedState){
            return Center(child: Text(state.loginResponseModel?.email??""),);
          }else if(state is LoginErrorState){
            return Center(child: Text(state.errorMag??""),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}


//credentitals
// {
// "username":"emilys",
// "password":"emilyspass"
// }
