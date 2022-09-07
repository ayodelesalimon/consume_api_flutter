import 'dart:convert';

import 'package:consume_api/constants.dart';
import 'package:consume_api/model/login_success_model.dart';
import 'package:http/http.dart' as http;

import 'model/model.dart';
import 'model/user_login_model.dart';

class ApiService{

Future <List<PostModel>?> getPosts() async {
  try{
    var url = Uri.parse(ApiConstant.baseUrl+ApiConstant.postUrl);
    var response = await http.get(url);
    if(response.statusCode == 200){
     List<PostModel> postModel = postModelFromJson(response.body);

     print(postModel);
     print(response.reasonPhrase);
     return postModel;
    }
    else{
      print(response.reasonPhrase);
      print(response.body);
    }

  }
  catch(e){
print(e.toString());
  }
}


Future<LoginSuccessModel?> login(LoginModel loginModel) async {

  try{
    var url = Uri.parse(ApiConstant.loginUrl);
    var response = await http.post(url, headers: {
      "Content-Type":"application/json"
    },
    body: jsonEncode(loginModel

        //<String, dynamic>{
      // "email":"techwrita1@gmail.com",
      // "password": "iloveyou95",
      // "device_ID": "1234567890"
   // }
    ));
print(jsonEncode(loginModel));
    if(response.statusCode == 200 || response.statusCode == 201){

      LoginSuccessModel loginSuccessModel = LoginSuccessModel.fromJson(json.decode(response.body));

      print(response.body);
      print(loginSuccessModel.data!.name);
      return loginSuccessModel;
    }
    else{
      print(response.reasonPhrase);
      print(response.body);
    }

  }
  catch(e){

  }
}

}

