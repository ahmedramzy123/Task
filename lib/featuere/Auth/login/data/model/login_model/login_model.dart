
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/user_info_model.dart';

/// status : 200
/// success : true
/// data : {"id":1,"first_name":"samer","last_name":"metwally","about":"searching for experts","tags":[{"id":1,"name":"إدارة البريد الإلكتروني"}],"favorite_social_media":["facebook"],"salary":100,"email":"samer@gmail.com","birth_date":"1970-01-25","gender":1,"type":{"code":1,"name":"buyer","nice_name":"مشتري"},"avatar":"https://kafiil.s3.eu-central-1.amazonaws.com/media/avatar/f60d29a947c20a54c5d090a4b8a45e2e/ziKtCPFBwiAxd5y5n24JULOej4ENgsyi.png"}
/// access_token : "$2y$10$dXT0YNXk1bu1XnP4CG.b2uNedZKP.8h0dHmPoCwAF/Cn8TRQMXbPy"

class LoginModel {
  LoginModel({
      num? status, 
      bool? success, 
      UserInfoModel? data,
      String? accessToken,}){
    _status = status;
    _success = success;
    _data = data;
    _accessToken = accessToken;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _data = json['data'] != null ? UserInfoModel.fromJson(json['data']) : null;
    _accessToken = json['access_token'];
  }
  num? _status;
  bool? _success;
  UserInfoModel? _data;
  String? _accessToken;
LoginModel copyWith({  num? status,
  bool? success,
  UserInfoModel? data,
  String? accessToken,
}) => LoginModel(  status: status ?? _status,
  success: success ?? _success,
  data: data ?? _data,
  accessToken: accessToken ?? _accessToken,
);
  num? get status => _status;
  bool? get success => _success;
  UserInfoModel? get data => _data;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['access_token'] = _accessToken;
    return map;
  }

}

/// id : 1
/// first_name : "samer"
/// last_name : "metwally"
/// about : "searching for experts"
/// tags : [{"id":1,"name":"إدارة البريد الإلكتروني"}]
/// favorite_social_media : ["facebook"]
/// salary : 100
/// email : "samer@gmail.com"
/// birth_date : "1970-01-25"
/// gender : 1
/// type : {"code":1,"name":"buyer","nice_name":"مشتري"}
/// avatar : "https://kafiil.s3.eu-central-1.amazonaws.com/media/avatar/f60d29a947c20a54c5d090a4b8a45e2e/ziKtCPFBwiAxd5y5n24JULOej4ENgsyi.png"


/// code : 1
/// name : "buyer"
/// nice_name : "مشتري"


/// id : 1
/// name : "إدارة البريد الإلكتروني"

