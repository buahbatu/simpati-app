// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mother_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mother _$MotherFromJson(Map<String, dynamic> json) {
  return Mother(
    id: json['ID'] as String,
    title: json['title'] as String,
    slug: json['slug'] as String,
    content: json['content'] as String,
    createdAt: json['created_at'] as String,
    status: json['status'] as String,
    atribut: json['atribut'] == null
        ? null
        : Atribut.fromJson(json['atribut'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MotherToJson(Mother instance) => <String, dynamic>{
      'ID': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
      'created_at': instance.createdAt,
      'status': instance.status,
      'atribut': instance.atribut,
    };

Atribut _$AtributFromJson(Map<String, dynamic> json) {
  return Atribut(
    posyandu: json['posyandu'] == null
        ? null
        : Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    nik: json['nik'] == null
        ? null
        : Posyandu.fromJson(json['nik'] as Map<String, dynamic>),
    namaSuami: json['nama_suami'] == null
        ? null
        : Posyandu.fromJson(json['nama_suami'] as Map<String, dynamic>),
    nikSuami: json['nik_suami'] == null
        ? null
        : Posyandu.fromJson(json['nik_suami'] as Map<String, dynamic>),
    tanggalLahir: json['tanggal_lahir'] == null
        ? null
        : Posyandu.fromJson(json['tanggal_lahir'] as Map<String, dynamic>),
    tempatLahir: json['tempat_lahir'] == null
        ? null
        : Posyandu.fromJson(json['tempat_lahir'] as Map<String, dynamic>),
    nomorHandphone: json['nomor_handphone'] == null
        ? null
        : Posyandu.fromJson(json['nomor_handphone'] as Map<String, dynamic>),
    golonganDarah: json['golongan_darah'] == null
        ? null
        : Posyandu.fromJson(json['golongan_darah'] as Map<String, dynamic>),
    alamat: json['alamat'] == null
        ? null
        : Posyandu.fromJson(json['alamat'] as Map<String, dynamic>),
    nomorBpjs: json['nomor_bpjs'] == null
        ? null
        : Posyandu.fromJson(json['nomor_bpjs'] as Map<String, dynamic>),
    statusKeluargaSejahtera: json['status_keluarga_sejahtera'] == null
        ? null
        : Posyandu.fromJson(
            json['status_keluarga_sejahtera'] as Map<String, dynamic>),
    nomorHandphoneAlternatif:
        json['status_keluarga_sejahtera(alternatif)'] == null
            ? null
            : Posyandu.fromJson(json['status_keluarga_sejahtera(alternatif)']
                as Map<String, dynamic>),
    catatan: json['catatan'] == null
        ? null
        : Posyandu.fromJson(json['catatan'] as Map<String, dynamic>),
  );
}

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) {
  return Posyandu(
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

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
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

MotherResponse _$MotherResponseFromJson(Map<String, dynamic> json) {
  return MotherResponse(
    motherList: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Mother.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MotherResponseToJson(MotherResponse instance) =>
    <String, dynamic>{
      'motherList': instance.motherList,
    };

RequestMother _$RequestMotherFromJson(Map<String, dynamic> json) {
  return RequestMother(
    title: json['title'] as String,
    content: json['content'] as String,
    atribut: json['atribut'] == null
        ? null
        : Atribut.fromJson(json['atribut'] as Map<String, dynamic>),
  );
}

Alamat _$AlamatFromJson(Map<String, dynamic> json) {
  return Alamat(
    content: json['content'] as String,
    caption: json['caption'] as String,
  );
}

Map<String, dynamic> _$AlamatToJson(Alamat instance) => <String, dynamic>{
      'content': instance.content,
      'caption': instance.caption,
    };
