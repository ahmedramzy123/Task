import 'package:equatable/equatable.dart';

import 'base_service_model.dart';

class ServiceModel extends Equatable 
{
	final int? status;
	final bool? success;
	final List<BaseServiceModel>? data;

	const ServiceModel({this.status, this.success, this.data});

	factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
				status: json['status'] as int?,
				success: json['success'] as bool?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => BaseServiceModel.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'success': success,
				'data': data?.map((e) => e.toJson()).toList(),
			};

	ServiceModel copyWith({
		int? status,
		bool? success,
		List<BaseServiceModel>? data,
	}) {
		return ServiceModel(
			status: status ?? this.status,
			success: success ?? this.success,
			data: data ?? this.data,
		);
	}

	@override
	List<Object?> get props => [status, success, data];
}
