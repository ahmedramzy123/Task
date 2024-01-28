import 'package:equatable/equatable.dart';

class BaseCountryModel extends Equatable 
{
	final int? id;
	final String? countryCode;
	final String? name;
	final String? capital;

	const BaseCountryModel({this.id, this.countryCode, this.name, this.capital});

	factory BaseCountryModel.fromJson(Map<String, dynamic> json) => BaseCountryModel(
				id: json['id'] as int?,
				countryCode: json['country_code'] as String?,
				name: json['name'] as String?,
				capital: json['capital'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'country_code': countryCode,
				'name': name,
				'capital': capital,
			};

	BaseCountryModel copyWith({
		int? id,
		String? countryCode,
		String? name,
		String? capital,
	}) {
		return BaseCountryModel(
			id: id ?? this.id,
			countryCode: countryCode ?? this.countryCode,
			name: name ?? this.name,
			capital: capital ?? this.capital,
		);
	}

	@override
	List<Object?> get props => [id, countryCode, name, capital];
}
