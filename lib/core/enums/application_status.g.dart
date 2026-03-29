// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationStatusAdapter extends TypeAdapter<ApplicationStatus> {
  @override
  final typeId = 1;

  @override
  ApplicationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ApplicationStatus.noReply;
      case 1:
        return ApplicationStatus.accepted;
      case 2:
        return ApplicationStatus.rejected;
      default:
        return ApplicationStatus.noReply;
    }
  }

  @override
  void write(BinaryWriter writer, ApplicationStatus obj) {
    switch (obj) {
      case ApplicationStatus.noReply:
        writer.writeByte(0);
      case ApplicationStatus.accepted:
        writer.writeByte(1);
      case ApplicationStatus.rejected:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
