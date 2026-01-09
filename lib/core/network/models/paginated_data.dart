import 'package:json_annotation/json_annotation.dart';

part 'paginated_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedData<T> {
  final List<T> data;
  final MetaData meta;

  const PaginatedData({required this.data, required this.meta});

  factory PaginatedData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedDataToJson(this, toJsonT);
}

@JsonSerializable()
class MetaData {
  final int total;
  final int skip;
  final int take;
  final bool hasMore;

  const MetaData({
    required this.total,
    required this.skip,
    required this.take,
    required this.hasMore,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
