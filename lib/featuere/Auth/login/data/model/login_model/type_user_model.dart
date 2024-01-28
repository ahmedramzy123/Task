class TypeUserModel {
  TypeUserModel({
    num? code,
    String? name,
    String? niceName,}){
    _code = code;
    _name = name;
    _niceName = niceName;
  }

  TypeUserModel.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _niceName = json['nice_name'];
  }
  num? _code;
  String? _name;
  String? _niceName;
  TypeUserModel copyWith({  num? code,
    String? name,
    String? niceName,
  }) => TypeUserModel(  code: code ?? _code,
    name: name ?? _name,
    niceName: niceName ?? _niceName,
  );
  num? get code => _code;
  String? get name => _name;
  String? get niceName => _niceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['nice_name'] = _niceName;
    return map;
  }

}
