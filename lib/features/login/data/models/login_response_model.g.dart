// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseModelAdapter extends TypeAdapter<LoginResponseModel> {
  @override
  final int typeId = 0;

  @override
  LoginResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponseModel(
      answer: fields[0] as String,
      supname: fields[1] as String,
      items: (fields[2] as List).cast<LoginItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.supname)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LoginItemAdapter extends TypeAdapter<LoginItem> {
  @override
  final int typeId = 1;

  @override
  LoginItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginItem(
      title: fields[0] as String?,
      type: fields[1] as String?,
      content: fields[2] as String?,
      action: fields[3] as String?,
      buttext: fields[4] as String?,
      cleft: fields[5] as String?,
      cright: fields[6] as String?,
      asol: fields[7] as String?,
      tval: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.action)
      ..writeByte(4)
      ..write(obj.buttext)
      ..writeByte(5)
      ..write(obj.cleft)
      ..writeByte(6)
      ..write(obj.cright)
      ..writeByte(7)
      ..write(obj.asol)
      ..writeByte(8)
      ..write(obj.tval);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
