import 'package:equatable/equatable.dart';

abstract class Asset extends Equatable {
  final int id;
  final String assetCode;
  final String name;
  final int? categoryId;
  final String? status;
  final double? purchasePrice;
  final String? model;
  final String? serial;
  final String? imageUrl;
  final String? condition;
  final int? locationId;
  final String? purchaseDate;
  final String? warrantyEnd;

  const Asset({
    required this.id,
    required this.assetCode,
    required this.name,
    this.categoryId,
    this.status,
    this.purchasePrice,
    this.model,
    this.serial,
    this.imageUrl,
    this.condition,
    this.locationId,
    this.purchaseDate,
    this.warrantyEnd,
  });

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
}
