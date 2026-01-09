// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedData<T> _$PaginatedDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedData<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      meta: MetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedDataToJson<T>(
  PaginatedData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'meta': instance.meta,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'total': instance.total,
      'skip': instance.skip,
      'take': instance.take,
      'hasMore': instance.hasMore,
    };
