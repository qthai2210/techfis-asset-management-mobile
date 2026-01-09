// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
// Trigger rebuild
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:hive/hive.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: 'AssetModelAdapter')
abstract class AssetModel with _$AssetModel implements Asset {
  const AssetModel._();

  const factory AssetModel({
    @HiveField(0) required int id,
    @HiveField(1) @JsonKey(name: 'asset_code') required String assetCode,
    @HiveField(2) required String name,
    @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
    @HiveField(4) String? status,
    @HiveField(5) @JsonKey(name: 'purchase_price') double? purchasePrice,
    @HiveField(6) String? model,
    @HiveField(7) String? serial,
    @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
    @HiveField(9) String? condition,
    @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
    @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
    @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        assetCode,
        name,
        categoryId,
        status,
        purchasePrice,
        model,
        serial,
        imageUrl,
        condition,
        locationId,
        purchaseDate,
        warrantyEnd,
      ];

  @override
  bool? get stringify => true;
}
