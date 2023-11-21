// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_favorite_book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFavoriteBookModelAdapter extends TypeAdapter<HiveFavoriteBookModel> {
  @override
  final int typeId = 0;

  @override
  HiveFavoriteBookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFavoriteBookModel(
      id: fields[0] as int,
      title: fields[1] as String,
      author: fields[2] as String,
      coverUrl: fields[3] as String,
      downloadUrl: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveFavoriteBookModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.coverUrl)
      ..writeByte(4)
      ..write(obj.downloadUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFavoriteBookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
