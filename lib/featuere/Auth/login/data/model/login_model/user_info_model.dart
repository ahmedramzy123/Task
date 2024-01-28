import 'package:taskkafille/featuere/Auth/login/data/model/login_model/tags_model.dart';
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/type_user_model.dart';


class UserInfoModel {
  UserInfoModel({
    num? id,
    String? firstName,
    String? lastName,
    String? about,
    List<TagsModel>? tags,
    List<String>? favoriteSocialMedia,
    num? salary,
    String? email,
    String? birthDate,
    num? gender,
    TypeUserModel? type,
    String? avatar,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _about = about;
    _tags = tags;
    _favoriteSocialMedia = favoriteSocialMedia;
    _salary = salary;
    _email = email;
    _birthDate = birthDate;
    _gender = gender;
    _type = type;
    _avatar = avatar;
  }

  UserInfoModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _about = json['about'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(TagsModel.fromJson(v));
      });
    }
    _favoriteSocialMedia = json['favorite_social_media'] != null ? json['favorite_social_media'].cast<String>() : [];
    _salary = json['salary'];
      _email = json['email'];
    _birthDate = json['birth_date'];
    _gender = json['gender'];
      _type = json['type'] != null ? TypeUserModel.fromJson(json['type']) : null;
    _avatar = json['avatar'];
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _about;
  List<TagsModel>? _tags;
  List<String>? _favoriteSocialMedia;
  num? _salary;
  String? _email;
  String? _birthDate;
  num? _gender;
  TypeUserModel? _type;
  String? _avatar;
  UserInfoModel copyWith({  num? id,
    String? firstName,
    String? lastName,
    String? about,
    List<TagsModel>? tags,
    List<String>? favoriteSocialMedia,
    num? salary,
    String? email,
    String? birthDate,
    num? gender,
    TypeUserModel? type,
    String? avatar,
  }) => UserInfoModel(  id: id ?? _id,
    firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    about: about ?? _about,
    tags: tags ?? _tags,
    favoriteSocialMedia: favoriteSocialMedia ?? _favoriteSocialMedia,
    salary: salary ?? _salary,
    email: email ?? _email,
    birthDate: birthDate ?? _birthDate,
    gender: gender ?? _gender,
    type: type ?? _type,
    avatar: avatar ?? _avatar,
  );
  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get about => _about;
  List<TagsModel>? get tags => _tags;
  List<String>? get favoriteSocialMedia => _favoriteSocialMedia;
  num? get salary => _salary;
  String? get email => _email;
  String? get birthDate => _birthDate;
  num? get gender => _gender;
  TypeUserModel? get type => _type;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['about'] = _about;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['favorite_social_media'] = _favoriteSocialMedia;
    map['salary'] = _salary;
    map['email'] = _email;
    map['birth_date'] = _birthDate;
    map['gender'] = _gender;
    if (_type != null) {
      map['type'] = _type?.toJson();
    }
    map['avatar'] = _avatar;
    return map;
  }

}
