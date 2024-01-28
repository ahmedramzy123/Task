
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../errors/faliuar.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return
      {
        "email": email,
        "password": password,
      };
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

enum TypeUser {
  buyer, //1
  seller, //2
  both, //3
}
// i will add more params later
extension TypeUserExtension on TypeUser
{
  int get value {
    switch (this) {
      case TypeUser.buyer:
        return 1;
      case TypeUser.seller:
        return 2;
      case TypeUser.both:
        return 3;
    }
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String about;
  final List<double> tags;
  final List<String> socialMedia;
  final num salary;
  final String birthdate;
  final bool ?gender;
  final TypeUser typeUser;
  final String ?avatar;
  final String passwordConfirmation;

  const RegisterParams
      ({
    required this.typeUser,
    required this.password,
    required this.email,
    required this.about,
    required this.birthdate,
    required this.firstName,
    required this.lastName,
    required this.salary,
    required this.socialMedia,
    required this.tags,
     required this.avatar,
    required this.passwordConfirmation,
    this.gender
  });

  Map<String , dynamic> toMap()
  {
   Map<String , dynamic> map ={};
    map["email"] = email;
    map["password"] = password;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["about"] = about;
    map["tags"] = tags;
    map["social_media"] = socialMedia;
    map["salary"] = salary;
    map["birthdate"] = birthdate;
    if(gender!=null)
    {
      map['gender'] = gender;
    }
    map["type_user"] = typeUser.value;
   
    map["avatar"] = avatar;
    
   
    map["password_confirmation"] = passwordConfirmation;
    return map;
  }
  FormData formData()
  {

    FormData formData =  FormData.fromMap
      (
      toMap()
    );
  
      formData.files.add(MapEntry("avatar", MultipartFile.fromFileSync(avatar!)));
    
    return formData;
  }

  @override
  List<Object?> get props =>
      [
        email,
        password,
        firstName,
        lastName,
        about,
        tags,
        socialMedia,
        salary,
        birthdate,
        gender,
        typeUser,
        avatar,
        passwordConfirmation,
      ];

}