// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => _AssetModel(
      id: (json['id'] as num).toInt(),
      assetCode: json['asset_code'] as String,
      name: json['name'] as String,
      categoryId: (json['category_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble(),
      model: json['model'] as String?,
      serial: json['serial'] as String?,
      imageUrl: json['image_url'] as String?,
      condition: json['condition'] as String?,
      locationId: (json['location_id'] as num?)?.toInt(),
      purchaseDate: json['purchase_date'] as String?,
      warrantyEnd: json['warranty_end'] as String?,
    );

Map<String, dynamic> _$AssetModelToJson(_AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'asset_code': instance.assetCode,
      'name': instance.name,
      'category_id': instance.categoryId,
      'status': instance.status,
      'purchase_price': instance.purchasePrice,
      'model': instance.model,
      'serial': instance.serial,
      'image_url': instance.imageUrl,
      'condition': instance.condition,
      'location_id': instance.locationId,
      'purchase_date': instance.purchaseDate,
      'warranty_end': instance.warrantyEnd,
    };
