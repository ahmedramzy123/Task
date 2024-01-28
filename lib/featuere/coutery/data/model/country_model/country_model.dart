import 'package:equatable/equatable.dart';

import 'base_country_model.dart';
import 'pagination.dart';

class CountryModel extends Equatable {
	final int? status;
	final bool? success;
	final List<BaseCountryModel>? data;
	final Pagination? pagination;

	const CountryModel({
		this.status, 
		this.success, 
		this.data, 
		this.pagination, 
	});

	factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
				status: json['status'] as int?,
				success: json['success'] as bool?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => BaseCountryModel.fromJson(e as Map<String, dynamic>))
						.toList(),
				pagination: json['pagination'] == null
						? null
						: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'success': success,
				'data': data?.map((e) => e.toJson()).toList(),
				'pagination': pagination?.toJson(),
			};

	CountryModel copyWith({
		int? status,
		bool? success,
		List<BaseCountryModel>? data,
		Pagination? pagination,
	}) {
		return CountryModel(
			status: status ?? this.status,
			success: success ?? this.success,
			data: data ?? this.data,
			pagination: pagination ?? this.pagination,
		);
	}

	@override
	List<Object?> get props => [status, success, data, pagination];
}
