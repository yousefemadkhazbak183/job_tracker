// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobApplicationModelAdapter extends TypeAdapter<JobApplicationModel> {
  @override
  final typeId = 0;

  @override
  JobApplicationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobApplicationModel(
      modelId: fields[0] as String,
      modelCompanyName: fields[1] as String,
      modelSource: fields[2] as String,
      modelAppliedDate: fields[3] as DateTime,
      modelStatus: fields[4] as ApplicationStatus,
      modelJobUrl: fields[5] as String?,
      modelCompanyEmail: fields[6] as String?,
      modelHrName: fields[7] as String?,
      modelHrLinkedInUrl: fields[8] as String?,
      modelInterviewDate: fields[9] as DateTime?,
      modelInterviewResult: fields[10] as InterviewResult?,
    );
  }

  @override
  void write(BinaryWriter writer, JobApplicationModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.modelId)
      ..writeByte(1)
      ..write(obj.modelCompanyName)
      ..writeByte(2)
      ..write(obj.modelSource)
      ..writeByte(3)
      ..write(obj.modelAppliedDate)
      ..writeByte(4)
      ..write(obj.modelStatus)
      ..writeByte(5)
      ..write(obj.modelJobUrl)
      ..writeByte(6)
      ..write(obj.modelCompanyEmail)
      ..writeByte(7)
      ..write(obj.modelHrName)
      ..writeByte(8)
      ..write(obj.modelHrLinkedInUrl)
      ..writeByte(9)
      ..write(obj.modelInterviewDate)
      ..writeByte(10)
      ..write(obj.modelInterviewResult);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobApplicationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
