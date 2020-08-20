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
    beratLahir: json['berat_lahir'] == null
        ? null
        : DataAtribut.fromJson(json['berat_lahir'] as Map<String, dynamic>),
    tinggi: json['tinggi'] == null
        ? null
        : DataAtribut.fromJson(json['tinggi'] as Map<String, dynamic>),
    kia: json['kia'] == null
        ? null
        : DataAtribut.fromJson(json['kia'] as Map<String, dynamic>),
    imd: json['imd'] == null
        ? null
        : DataAtribut.fromJson(json['imd'] as Map<String, dynamic>),
    namaOrtu: json['nama_orang_tua'] == null
        ? null
        : DataAtribut.fromJson(json['nama_orang_tua'] as Map<String, dynamic>),
    nikOrtu: json['nik_orang_tua'] == null
        ? null
        : DataAtribut.fromJson(json['nik_orang_tua'] as Map<String, dynamic>),
    hpOrtu: json['nomor_handphone'] == null
        ? null
        : DataAtribut.fromJson(json['nomor_handphone'] as Map<String, dynamic>),
    alamat: json['alamat'] == null
        ? null
        : DataAtribut.fromJson(json['alamat'] as Map<String, dynamic>),
    rt: json['rt'] == null
        ? null
        : DataAtribut.fromJson(json['rt'] as Map<String, dynamic>),
    rw: json['rw'] == null
        ? null
        : DataAtribut.fromJson(json['rw'] as Map<String, dynamic>),
    statusGiziTbU: json['status_gizi_tb_u'] == null
        ? null
        : DataAtribut.fromJson(
            json['status_gizi_tb_u'] as Map<String, dynamic>),
    statusGiziBbU: json['status_gizi_bb_u'] == null
        ? null
        : DataAtribut.fromJson(
            json['status_gizi_bb_u'] as Map<String, dynamic>),
    statusGiziBbTb: json['status_gizi_bb_tb'] == null
        ? null
        : DataAtribut.fromJson(
            json['status_gizi_bb_tb'] as Map<String, dynamic>),
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
      'berat_lahir': instance.beratLahir?.toJson(),
      'tinggi': instance.tinggi?.toJson(),
      'kia': instance.kia?.toJson(),
      'imd': instance.imd?.toJson(),
      'nama_orang_tua': instance.namaOrtu?.toJson(),
      'nik_orang_tua': instance.nikOrtu?.toJson(),
      'nomor_handphone': instance.hpOrtu?.toJson(),
      'alamat': instance.alamat?.toJson(),
      'rt': instance.rt?.toJson(),
      'rw': instance.rw?.toJson(),
      'status_gizi_tb_u': instance.statusGiziTbU?.toJson(),
      'status_gizi_bb_u': instance.statusGiziBbU?.toJson(),
      'status_gizi_bb_tb': instance.statusGiziBbTb?.toJson(),
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

ChildAddRequest _$ChildAddRequestFromJson(Map<String, dynamic> json) {
  return ChildAddRequest(
    title: json['title'] as String,
    content: json['content'] as String,
    atribut: json['atribut'] == null
        ? null
        : ChildAddAtrForRequest.fromJson(
            json['atribut'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChildAddRequestToJson(ChildAddRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'atribut': instance.atribut?.toJson(),
    };

ChildAddAtrForRequest _$ChildAddAtrForRequestFromJson(
    Map<String, dynamic> json) {
  return ChildAddAtrForRequest(
    tanggalLahir: json['tanggal_lahir'] == null
        ? null
        : DataRequest.fromJson(json['tanggal_lahir'] as Map<String, dynamic>),
    anakKe: json['anak_ke'] == null
        ? null
        : DataRequest.fromJson(json['anak_ke'] as Map<String, dynamic>),
    jenisKelamin: json['jenis_kelamin'] == null
        ? null
        : DataRequest.fromJson(json['jenis_kelamin'] as Map<String, dynamic>),
    nomorKK: json['nomor_KK'] == null
        ? null
        : DataRequest.fromJson(json['nomor_KK'] as Map<String, dynamic>),
    nik: json['nik'] == null
        ? null
        : DataRequest.fromJson(json['nik'] as Map<String, dynamic>),
    namaAnak: json['nama_anak'] == null
        ? null
        : DataRequest.fromJson(json['nama_anak'] as Map<String, dynamic>),
    beratLahir: json['berat_lahir'] == null
        ? null
        : DataRequest.fromJson(json['berat_lahir'] as Map<String, dynamic>),
    tinggi: json['tinggi'] == null
        ? null
        : DataRequest.fromJson(json['tinggi'] as Map<String, dynamic>),
    kia: json['kia'] == null
        ? null
        : DataRequest.fromJson(json['kia'] as Map<String, dynamic>),
    ibu: json['ibu'] == null
        ? null
        : DataRequest.fromJson(json['ibu'] as Map<String, dynamic>),
    imd: json['imd'] == null
        ? null
        : DataRequest.fromJson(json['imd'] as Map<String, dynamic>),
    namaOrtu: json['nama_ortu'] == null
        ? null
        : DataRequest.fromJson(json['nama_ortu'] as Map<String, dynamic>),
    nikOrtu: json['nik_ortu'] == null
        ? null
        : DataRequest.fromJson(json['nik_ortu'] as Map<String, dynamic>),
    hpOrtu: json['hp_ortu'] == null
        ? null
        : DataRequest.fromJson(json['hp_ortu'] as Map<String, dynamic>),
    alamat: json['alamat'] == null
        ? null
        : DataRequest.fromJson(json['alamat'] as Map<String, dynamic>),
    rt: json['rt'] == null
        ? null
        : DataRequest.fromJson(json['rt'] as Map<String, dynamic>),
    rw: json['rw'] == null
        ? null
        : DataRequest.fromJson(json['rw'] as Map<String, dynamic>),
    statusGiziTbU: json['status_gizi_tb_u'] == null
        ? null
        : DataRequest.fromJson(
            json['status_gizi_tb_u'] as Map<String, dynamic>),
    statusGiziBbU: json['status_gizi_bb_u'] == null
        ? null
        : DataRequest.fromJson(
            json['status_gizi_bb_u'] as Map<String, dynamic>),
    statusGiziBbTb: json['status_gizi_bb_tb'] == null
        ? null
        : DataRequest.fromJson(
            json['status_gizi_bb_tb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChildAddAtrForRequestToJson(
        ChildAddAtrForRequest instance) =>
    <String, dynamic>{
      'tanggal_lahir': instance.tanggalLahir,
      'anak_ke': instance.anakKe,
      'jenis_kelamin': instance.jenisKelamin,
      'nomor_KK': instance.nomorKK,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'berat_lahir': instance.beratLahir,
      'tinggi': instance.tinggi,
      'kia': instance.kia,
      'imd': instance.imd,
      'nama_ortu': instance.namaOrtu,
      'ibu': instance.ibu,
      'nik_ortu': instance.nikOrtu,
      'hp_ortu': instance.hpOrtu,
      'alamat': instance.alamat,
      'rt': instance.rt,
      'rw': instance.rw,
      'status_gizi_tb_u': instance.statusGiziTbU,
      'status_gizi_bb_u': instance.statusGiziBbU,
      'status_gizi_bb_tb': instance.statusGiziBbTb,
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
