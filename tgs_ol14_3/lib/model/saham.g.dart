// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saham.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SahamAdapter extends TypeAdapter<Saham> {
  @override
  Saham read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Saham(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Saham obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.level);
  }
}
