import 'package:hive/hive.dart';
import 'asset_model.dart';

class AssetModelAdapter extends TypeAdapter<AssetModel> {
  @override
  final int typeId = 0;

  @override
  AssetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetModel(
      id: fields[0] as int,
      assetCode: fields[1] as String,
      name: fields[2] as String,
      categoryId: fields[3] as int?,
      status: fields[4] as String?,
      purchasePrice: fields[5] as double?,
      model: fields[6] as String?,
      serial: fields[7] as String?,
      imageUrl: fields[8] as String?,
      condition: fields[9] as String?,
      locationId: fields[10] as int?,
      purchaseDate: fields[11] as String?,
      warrantyEnd: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.assetCode)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.purchasePrice)
      ..writeByte(6)
      ..write(obj.model)
      ..writeByte(7)
      ..write(obj.serial)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.condition)
      ..writeByte(10)
      ..write(obj.locationId)
      ..writeByte(11)
      ..write(obj.purchaseDate)
      ..writeByte(12)
      ..write(obj.warrantyEnd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
