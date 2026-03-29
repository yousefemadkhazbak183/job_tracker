// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InterviewResultAdapter extends TypeAdapter<InterviewResult> {
  @override
  final typeId = 2;

  @override
  InterviewResult read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return InterviewResult.accepted;
      case 1:
        return InterviewResult.rejected;
      default:
        return InterviewResult.accepted;
    }
  }

  @override
  void write(BinaryWriter writer, InterviewResult obj) {
    switch (obj) {
      case InterviewResult.accepted:
        writer.writeByte(0);
      case InterviewResult.rejected:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterviewResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
