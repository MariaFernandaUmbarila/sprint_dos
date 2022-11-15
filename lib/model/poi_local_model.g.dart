// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPoiAdapter extends TypeAdapter<LocalPoi> {
  @override
  final int typeId = 0;

  @override
  LocalPoi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPoi()
      ..nombre = fields[0] as String?
      ..foto = fields[1] as String?
      ..ciudad = fields[2] as String?
      ..departamento = fields[3] as String?
      ..descripcion = fields[4] as String?
      ..temperatura = fields[5] as String?
      ..id = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalPoi obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.nombre)
      ..writeByte(1)
      ..write(obj.foto)
      ..writeByte(2)
      ..write(obj.ciudad)
      ..writeByte(3)
      ..write(obj.departamento)
      ..writeByte(4)
      ..write(obj.descripcion)
      ..writeByte(5)
      ..write(obj.temperatura)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPoiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
