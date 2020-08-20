// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyRequest _$PregnancyRequestFromJson(Map<String, dynamic> json) {
  return PregnancyRequest(
    title: json['title'] as String,
    content: json['content'] as String,
    atribut: json['atribut'] == null
        ? null
        : PregnancyAtrForRequest.fromJson(
            json['atribut'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PregnancyRequestToJson(PregnancyRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'atribut': instance.atribut,
    };

PregnancyAtrForRequest _$PregnancyAtrForRequestFromJson(
    Map<String, dynamic> json) {
  return PregnancyAtrForRequest(
    title: json['title'] as String,
    nik: json['nik'] == null
        ? null
        : DataRequest.fromJson(json['nik'] as Map<String, dynamic>),
    namaSuami: json['nama_suami'] == null
        ? null
        : DataRequest.fromJson(json['nama_suami'] as Map<String, dynamic>),
    tanggalLahir: json['tanggal_lahir'] == null
        ? null
        : DataRequest.fromJson(json['tanggal_lahir'] as Map<String, dynamic>),
    ibu: json['ibu'] == null
        ? null
        : DataRequest.fromJson(json['ibu'] as Map<String, dynamic>),
    lastMenstruation: json['terakhir_mensturasi'] == null
        ? null
        : DataRequest.fromJson(
            json['terakhir_mensturasi'] as Map<String, dynamic>),
    menstruationCycle: json['siklus_menstruasi'] == null
        ? null
        : DataRequest.fromJson(
            json['siklus_menstruasi'] as Map<String, dynamic>),
    weight: json['berat'] == null
        ? null
        : DataRequest.fromJson(json['berat'] as Map<String, dynamic>),
    height: json['tinggi'] == null
        ? null
        : DataRequest.fromJson(json['tinggi'] as Map<String, dynamic>),
    bloodPressure: json['tekanan_darah'] == null
        ? null
        : DataRequest.fromJson(json['tekanan_darah'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PregnancyAtrForRequestToJson(
        PregnancyAtrForRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'nik': instance.nik,
      'nama_suami': instance.namaSuami,
      'tanggal_lahir': instance.tanggalLahir,
      'terakhir_mensturasi': instance.lastMenstruation,
      'siklus_menstruasi': instance.menstruationCycle,
      'berat': instance.weight,
      'ibu': instance.ibu,
      'tinggi': instance.height,
      'tekanan_darah': instance.bloodPressure,
    };

DataRequest _$DataRequestFromJson(Map<String, dynamic> json) {
  return DataRequest(
    content: json['content'] as String,
    caption: json['caption'] as String,
  );
}

Map<String, dynamic> _$DataRequestToJson(DataRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'caption': instance.caption,
    };
