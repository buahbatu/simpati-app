// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseChildren _$ResponseChildrenFromJson(Map<String, dynamic> json) {
  return ResponseChildren(
    childrenList: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ChildrenForResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseChildrenToJson(ResponseChildren instance) =>
    <String, dynamic>{
      'data': instance.childrenList,
    };

ChildrenForResponse _$ChildrenForResponseFromJson(Map<String, dynamic> json) {
  return ChildrenForResponse(
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

Map<String, dynamic> _$ChildrenForResponseToJson(
        ChildrenForResponse instance) =>
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
    ibu: json['ibu'] == null
        ? null
        : DataAtribut.fromJson(json['ibu'] as Map<String, dynamic>),
    kehamilan: json['kehamilan'] == null
        ? null
        : DataAtribut.fromJson(json['kehamilan'] as Map<String, dynamic>),
    tanggalLahir: json['tanggal_lahir'] == null
        ? null
        : DataAtribut.fromJson(json['tanggal_lahir'] as Map<String, dynamic>),
    tempatLahir: json['tempat_lahir'] == null
        ? null
        : DataAtribut.fromJson(json['tempat_lahir'] as Map<String, dynamic>),
    golonganDarah: json['golongan_darah'] == null
        ? null
        : DataAtribut.fromJson(json['golongan_darah'] as Map<String, dynamic>),
    nomorBpjs: json['bpjs_number'] == null
        ? null
        : DataAtribut.fromJson(json['bpjs_number'] as Map<String, dynamic>),
    jenisKelamin: json['jenis_kelamin'] == null
        ? null
        : DataAtribut.fromJson(json['jenis_kelamin'] as Map<String, dynamic>),
    note: json['note'] == null
        ? null
        : DataAtribut.fromJson(json['note'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AtributForResponseToJson(AtributForResponse instance) =>
    <String, dynamic>{
      'posyandu': instance.posyandu?.toJson(),
      'nik': instance.nik?.toJson(),
      'ibu': instance.ibu?.toJson(),
      'kehamilan': instance.kehamilan?.toJson(),
      'tanggal_lahir': instance.tanggalLahir?.toJson(),
      'tempat_lahir': instance.tempatLahir?.toJson(),
      'golongan_darah': instance.golonganDarah?.toJson(),
      'bpjs_number': instance.nomorBpjs?.toJson(),
      'jenis_kelamin': instance.jenisKelamin?.toJson(),
      'note': instance.note?.toJson(),
    };

DataAtribut _$DataAtributFromJson(Map<String, dynamic> json) {
  return DataAtribut(
    id: json['ID'] as String,
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
      'ID': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'content': instance.content,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['ID'] as String,
    content: json['content'] as String,
    caption: json['caption'] as String,
    dataType: json['data_type'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ID': instance.id,
      'content': instance.content,
      'caption': instance.caption,
      'data_type': instance.dataType,
    };
