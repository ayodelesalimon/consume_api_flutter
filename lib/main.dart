import 'package:consume_api/model/user_login_model.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';
import 'model/login_success_model.dart';
import 'model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
TextEditingController emailTEC = TextEditingController();
TextEditingController paswordTEC = TextEditingController();
  List<PostModel>? postsModel = [];
  LoginSuccessModel? loginSuccessModel = LoginSuccessModel();
  LoginModel? loginModel = LoginModel();
  String? deviceID = "1234567890";
  GlobalKey<FormState> key = GlobalKey();

  void getPostList() async {
 //   postsModel = await ApiService().getPosts();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostList();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Form(
        key: key,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             TextFormField(
               onSaved: (String? v){
                 setState(() {

                   loginModel!.email = emailTEC.text;
                   print(loginModel!.email!);
                 });

               },
               decoration: InputDecoration(
                 hintText: "Email"
               ),
               controller: emailTEC,
             ),

            TextFormField(
              onSaved: (String? v){
                setState(() {
                  loginModel!.password = paswordTEC.text;
                   loginModel!.deviceID = deviceID;

                  print(loginModel!.password!);
                  print(loginModel!.deviceID!);
                });

              },
              decoration: InputDecoration(
                hintText: "Password"
              ),
              controller: paswordTEC,
            ),

            TextButton(onPressed: () async {

              key.currentState!.save();


            await ApiService().login(loginModel!);
            }, child: Text("Login"))

          ],
        ),
      ),

    );
  }
}
