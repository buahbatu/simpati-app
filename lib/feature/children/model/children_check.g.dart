// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckChildResponse _$CheckChildResponseFromJson(Map<String, dynamic> json) {
  return CheckChildResponse(
    checkChildList: (json['data'] as List)
        ?.map((e) => e == null ? null : CheckChildForResponse.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$CheckChildResponseToJson(CheckChildResponse instance) =>
    <String, dynamic>{
      'data': instance.checkChildList,
    };

CheckChildForResponse _$CheckChildForResponseFromJson(
    Map<String, dynamic> json) {
  return CheckChildForResponse(
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

Map<String, dynamic> _$CheckChildForResponseToJson(
        CheckChildForResponse instance) =>
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
    tanggalCek: json['tanggal_cek'] == null
        ? null
        : DataAtribut.fromJson(json['tanggal_cek'] as Map<String, dynamic>),
    metodePengukuran: json['metode_pengukuran'] == null
        ? null
        : DataAtribut.fromJson(
            json['metode_pengukuran'] as Map<String, dynamic>),
    posyandu: json['posyandu'] == null
        ? null
        : DataAtribut.fromJson(json['posyandu'] as Map<String, dynamic>),
    anak: json['anak'] == null
        ? null
        : DataAtribut.fromJson(json['anak'] as Map<String, dynamic>),
    panjangBadan: json['panjang_badan'] == null
        ? null
        : DataAtribut.fromJson(json['panjang_badan'] as Map<String, dynamic>),
    umurDalamBulan: json['umur_(dalam_bulan)'] == null
        ? null
        : DataAtribut.fromJson(
            json['umur_(dalam_bulan)'] as Map<String, dynamic>),
    beratBadan: json['berat_badan'] == null
        ? null
        : DataAtribut.fromJson(json['berat_badan'] as Map<String, dynamic>),
    diameterKepala: json['diameter_kepala'] == null
        ? null
        : DataAtribut.fromJson(json['diameter_kepala'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AtributForResponseToJson(AtributForResponse instance) =>
    <String, dynamic>{
      'tanggal_cek': instance.tanggalCek?.toJson(),
      'metode_pengukuran': instance.metodePengukuran?.toJson(),
      'posyandu': instance.posyandu?.toJson(),
      'anak': instance.anak?.toJson(),
      'panjang_badan': instance.panjangBadan?.toJson(),
      'umur_(dalam_bulan)': instance.umurDalamBulan?.toJson(),
      'berat_badan': instance.beratBadan?.toJson(),
      'diameter_kepala': instance.diameterKepala?.toJson(),
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

ChildMedicalCheckRequest _$ChildMedicalCheckRequestFromJson(
    Map<String, dynamic> json) {
  return ChildMedicalCheckRequest(
    title: json['title'] as String,
    content: json['content'] as String,
    atribut: json['atribut'] == null
        ? null
        : ChildMedicalCheckAtrForRequest.fromJson(
            json['atribut'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChildMedicalCheckRequestToJson(
        ChildMedicalCheckRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'atribut': instance.atribut?.toJson(),
    };

ChildMedicalCheckAtrForRequest _$ChildMedicalCheckAtrForRequestFromJson(
    Map<String, dynamic> json) {
  return ChildMedicalCheckAtrForRequest(
    anak: json['anak'] == null
        ? null
        : DataRequest.fromJson(json['anak'] as Map<String, dynamic>),
    tanggalCek: json['tanggal_cek'] == null
        ? null
        : DataRequest.fromJson(json['tanggal_cek'] as Map<String, dynamic>),
    metodeUkur: json['metode_pengukuran'] == null
        ? null
        : DataRequest.fromJson(
            json['metode_pengukuran'] as Map<String, dynamic>),
    panjangBadan: json['panjang_badan'] == null
        ? null
        : DataRequest.fromJson(json['panjang_badan'] as Map<String, dynamic>),
    beratBadan: json['berat_badan'] == null
        ? null
        : DataRequest.fromJson(json['berat_badan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChildMedicalCheckAtrForRequestToJson(
        ChildMedicalCheckAtrForRequest instance) =>
    <String, dynamic>{
      'anak': instance.anak,
      'tanggal_cek': instance.tanggalCek,
      'metode_pengukuran': instance.metodeUkur,
      'panjang_badan': instance.panjangBadan,
      'berat_badan': instance.beratBadan,
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
