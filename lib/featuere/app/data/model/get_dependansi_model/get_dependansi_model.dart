import 'package:equatable/equatable.dart';

import 'data.dart';

class GetDependansiModel extends Equatable {
	final int? status;
	final bool? success;
	final Data? data;

	const GetDependansiModel({this.status, this.success, this.data});

	factory GetDependansiModel.fromJson(Map<String, dynamic> json) {
		return GetDependansiModel(
			status: json['status'] as int?,
			success: json['success'] as bool?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'success': success,
				'data': data?.toJson(),
			};

	@override
	List<Object?> get props => [status, success, data];
}
