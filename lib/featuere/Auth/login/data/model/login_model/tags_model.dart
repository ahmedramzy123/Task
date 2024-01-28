class TagsModel {
  TagsModel({
    num? id,
    String? name,}){
    _id = id;
    _name = name;
  }

  TagsModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  TagsModel copyWith({  num? id,
    String? name,
  }) => TagsModel(  id: id ?? _id,
    name: name ?? _name,
  );
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}