part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeAdapter extends TypeAdapter<Node> {
  @override
  final int typeId = 0;

  @override
  Node read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Node(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[4] as int,  // Back to original order - yesID
      fields[3] as int,  // Back to original order - noID
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Node obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.iD)
      ..writeByte(1)
      ..write(obj.backID)
      ..writeByte(2)
      ..write(obj.restartID)
      ..writeByte(3)
      ..write(obj.noID)
      ..writeByte(4)
      ..write(obj.yesID)
      ..writeByte(5)
      ..write(obj.question)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}