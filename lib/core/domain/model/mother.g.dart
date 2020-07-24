// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mother.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MotherRequestToJson(MotherRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'atribut': instance.atribut?.toJson(),
    };

Map<String, dynamic> _$MotherAtrForRequestToJson(
        MotherAtrForRequest instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'nama_suami': instance.namaSuami,
      'nik_suami': instance.nikSuami,
      'tanggal_lahir': instance.tanggalLahir,
      'nomor_handphone': instance.nomorHandphone,
      'golongan_darah': instance.golonganDarah,
      'alamat': instance.alamat,
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

ResponseMother _$ResponseMotherFromJson(Map<String, dynamic> json) {
  return ResponseMother(
    motherList: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : MotherForResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseMotherToJson(ResponseMother instance) =>
    <String, dynamic>{
      'data': instance.motherList,
    };

MotherForResponse _$MotherForResponseFromJson(Map<String, dynamic> json) {
  return MotherForResponse(
    id: json['ID'] as String,
    title: json['title'] as String,
    slug: json['slug'] as String,
    content: json['content'] as String,
    createdAt: json['created_at'] as String,
    status: json['status'] as String,
    atribut: json['atribut'] == null
        ? null
        : AtributForResponse.fromJson(json['atribut'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MotherForResponseToJson(MotherForResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
      'created_at': instance.createdAt,
      'status': instance.status,
      'atribut': instance.atribut,
    };

AtributForResponse _$AtributForResponseFromJson(Map<String, dynamic> json) {
  return AtributForResponse(
    posyandu: json['posyandu'] == null
        ? null
        : DataAtribut.fromJson(json['posyandu'] as Map<String, dynamic>),
    nik: json['nik'] == null
        ? null
        : DataAtribut.fromJson(json['nik'] as Map<String, dynamic>),
    namaSuami: json['nama_suami'] == null
        ? null
        : DataAtribut.fromJson(json['nama_suami'] as Map<String, dynamic>),
    nikSuami: json['nik_suami'] == null
        ? null
        : DataAtribut.fromJson(json['nik_suami'] as Map<String, dynamic>),
    tanggalLahir: json['tanggal_lahir'] == null
        ? null
        : DataAtribut.fromJson(json['tanggal_lahir'] as Map<String, dynamic>),
    tempatLahir: json['tempat_lahir'] == null
        ? null
        : DataAtribut.fromJson(json['tempat_lahir'] as Map<String, dynamic>),
    nomorHandphone: json['nomor_handphone'] == null
        ? null
        : DataAtribut.fromJson(json['nomor_handphone'] as Map<String, dynamic>),
    golonganDarah: json['golongan_darah'] == null
        ? null
        : DataAtribut.fromJson(json['golongan_darah'] as Map<String, dynamic>),
    alamat: json['alamat'] == null
        ? null
        : DataAtribut.fromJson(json['alamat'] as Map<String, dynamic>),
    nomorBpjs: json['nomor_bpjs'] == null
        ? null
        : DataAtribut.fromJson(json['nomor_bpjs'] as Map<String, dynamic>),
    statusKeluargaSejahtera: json['status_keluarga_sejahtera'] == null
        ? null
        : DataAtribut.fromJson(
            json['status_keluarga_sejahtera'] as Map<String, dynamic>),
    nomorHandphoneAlternatif:
        json['status_keluarga_sejahtera(alternatif)'] == null
            ? null
            : DataAtribut.fromJson(json['status_keluarga_sejahtera(alternatif)']
                as Map<String, dynamic>),
    catatan: json['catatan'] == null
        ? null
        : DataAtribut.fromJson(json['catatan'] as Map<String, dynamic>),
  );
}

DataAtribut _$DataAtributFromJson(Map<String, dynamic> json) {
  return DataAtribut(
    id: json['id'] as String,
    slug: json['slug'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataAtributToJson(DataAtribut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'content': instance.content,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as String,
    content: json['content'] as String,
    caption: json['caption'] as String,
    dataType: json['dataType'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'caption': instance.caption,
      'dataType': instance.dataType,
    };
