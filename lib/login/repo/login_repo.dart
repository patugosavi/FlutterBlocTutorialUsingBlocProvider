import 'dart:convert';

import 'package:flutter_bloc_tutorial/login/model/login_req_model.dart';
import 'package:flutter_bloc_tutorial/login/model/login_resp_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo{

 Future<LoginResponseModel> login(String userName,String password) async{
    var url="https://dummyjson.com/auth/login";

    LoginReqModel loginReqModel=LoginReqModel(username:userName,password:password);

   http.Response response= await http.post(Uri.parse(url),
    headers: {'Content-Type':'application/json'},
    body:jsonEncode(loginReqModel.toJson())
    );


      if(response.statusCode==200){

        var resp=response.body;
        
       var respBody= jsonDecode(resp);

        return LoginResponseModel.fromJson(respBody);

      }else{
        // return LoginResponseModel();
        throw Exception("Invalid Credentitials");
   }
  }
}