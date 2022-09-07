class LoginModel {
  String? email;
  String? password;
  String? deviceID;

  LoginModel({this.email, this.password, this.deviceID});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceID = json['device_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_ID'] = this.deviceID;
    return data;
  }
}