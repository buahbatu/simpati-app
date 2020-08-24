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
    umurDalamHari: json['umur_dalam_hari'] == null
        ? null
        : DataAtribut.fromJson(json['umur_dalam_hari'] as Map<String, dynamic>),
    beratBadan: json['berat_badan'] == null
        ? null
        : DataAtribut.fromJson(json['berat_badan'] as Map<String, dynamic>),
    diameterKepala: json['diameter_kepala'] == null
        ? null
        : DataAtribut.fromJson(json['diameter_kepala'] as Map<String, dynamic>),
  )
    ..statusGiziBbU = json['status_gizi_bb_u'] == null
        ? null
        : DataAtribut.fromJson(json['status_gizi_bb_u'] as Map<String, dynamic>)
    ..statusGiziTbU = json['status_gizi_tb_u'] == null
        ? null
        : DataAtribut.fromJson(json['status_gizi_tb_u'] as Map<String, dynamic>)
    ..statusGiziBbTb = json['status_gizi_bb_tb'] == null
        ? null
        : DataAtribut.fromJson(
            json['status_gizi_bb_tb'] as Map<String, dynamic>)
    ..zScoreBbU = json['zscore_bb_u'] == null
        ? null
        : DataAtribut.fromJson(json['zscore_bb_u'] as Map<String, dynamic>)
    ..zScoreTbU = json['zscore_tb_u'] == null
        ? null
        : DataAtribut.fromJson(json['zscore_tb_u'] as Map<String, dynamic>)
    ..zScoreBbTb = json['zscore_bb_tb'] == null
        ? null
        : DataAtribut.fromJson(json['zscore_bb_tb'] as Map<String, dynamic>)
    ..vitaminA = json['vitamin_a'] == null
        ? null
        : DataAtribut.fromJson(json['vitamin_a'] as Map<String, dynamic>)
    ..asiBulan1 = json['asi_bulan_1'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_1'] as Map<String, dynamic>)
    ..asiBulan2 = json['asi_bulan_2'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_2'] as Map<String, dynamic>)
    ..asiBulan3 = json['asi_bulan_3'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_3'] as Map<String, dynamic>)
    ..asiBulan4 = json['asi_bulan_4'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_4'] as Map<String, dynamic>)
    ..asiBulan5 = json['asi_bulan_5'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_5'] as Map<String, dynamic>)
    ..asiBulan6 = json['asi_bulan_6'] == null
        ? null
        : DataAtribut.fromJson(json['asi_bulan_6'] as Map<String, dynamic>)
    ..pemberianKe = json['pemberian_ke'] == null
        ? null
        : DataAtribut.fromJson(json['pemberian_ke'] as Map<String, dynamic>)
    ..sumberPmt = json['sumber_pmt'] == null
        ? null
        : DataAtribut.fromJson(json['sumber_pmt'] as Map<String, dynamic>)
    ..pemberianPusat = json['pemberian_pusat'] == null
        ? null
        : DataAtribut.fromJson(json['pemberian_pusat'] as Map<String, dynamic>)
    ..tahunProduksi = json['tahun_produksi'] == null
        ? null
        : DataAtribut.fromJson(json['tahun_produksi'] as Map<String, dynamic>)
    ..pemberianDaerah = json['pemberian_daerah'] == null
        ? null
        : DataAtribut.fromJson(
            json['pemberian_daerah'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AtributForResponseToJson(AtributForResponse instance) =>
    <String, dynamic>{
      'tanggal_cek': instance.tanggalCek?.toJson(),
      'metode_pengukuran': instance.metodePengukuran?.toJson(),
      'posyandu': instance.posyandu?.toJson(),
      'anak': instance.anak?.toJson(),
      'panjang_badan': instance.panjangBadan?.toJson(),
      'umur_dalam_hari': instance.umurDalamHari?.toJson(),
      'berat_badan': instance.beratBadan?.toJson(),
      'diameter_kepala': instance.diameterKepala?.toJson(),
      'status_gizi_bb_u': instance.statusGiziBbU?.toJson(),
      'status_gizi_tb_u': instance.statusGiziTbU?.toJson(),
      'status_gizi_bb_tb': instance.statusGiziBbTb?.toJson(),
      'zscore_bb_u': instance.zScoreBbU?.toJson(),
      'zscore_tb_u': instance.zScoreTbU?.toJson(),
      'zscore_bb_tb': instance.zScoreBbTb?.toJson(),
      'vitamin_a': instance.vitaminA?.toJson(),
      'asi_bulan_1': instance.asiBulan1?.toJson(),
      'asi_bulan_2': instance.asiBulan2?.toJson(),
      'asi_bulan_3': instance.asiBulan3?.toJson(),
      'asi_bulan_4': instance.asiBulan4?.toJson(),
      'asi_bulan_5': instance.asiBulan5?.toJson(),
      'asi_bulan_6': instance.asiBulan6?.toJson(),
      'pemberian_ke': instance.pemberianKe?.toJson(),
      'sumber_pmt': instance.sumberPmt?.toJson(),
      'pemberian_pusat': instance.pemberianPusat?.toJson(),
      'tahun_produksi': instance.tahunProduksi?.toJson(),
      'pemberian_daerah': instance.pemberianDaerah?.toJson(),
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
    umurDalamHari: json['umur_dalam_hari'] == null
        ? null
        : DataRequest.fromJson(json['umur_dalam_hari'] as Map<String, dynamic>),
    diameterKepala: json['diameter_kepala'] == null
        ? null
        : DataRequest.fromJson(json['diameter_kepala'] as Map<String, dynamic>),
    vitaminA: json['vitamin_a'] == null
        ? null
        : DataRequest.fromJson(json['vitamin_a'] as Map<String, dynamic>),
    asi1: json['asi_bulan_1'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_1'] as Map<String, dynamic>),
    asi2: json['asi_bulan_2'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_2'] as Map<String, dynamic>),
    asi3: json['asi_bulan_3'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_3'] as Map<String, dynamic>),
    asi4: json['asi_bulan_4'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_4'] as Map<String, dynamic>),
    asi5: json['asi_bulan_5'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_5'] as Map<String, dynamic>),
    asi6: json['asi_bulan_6'] == null
        ? null
        : DataRequest.fromJson(json['asi_bulan_6'] as Map<String, dynamic>),
    pemberianKe: json['pemberian_ke'] == null
        ? null
        : DataRequest.fromJson(json['pemberian_ke'] as Map<String, dynamic>),
    sumberPmt: json['sumber_pmt'] == null
        ? null
        : DataRequest.fromJson(json['sumber_pmt'] as Map<String, dynamic>),
    pemberianPusat: json['pemberian_pusat'] == null
        ? null
        : DataRequest.fromJson(json['pemberian_pusat'] as Map<String, dynamic>),
    tahunProduksi: json['tahun_produksi'] == null
        ? null
        : DataRequest.fromJson(json['tahun_produksi'] as Map<String, dynamic>),
    pemberianDaerah: json['pemberian_daerah'] == null
        ? null
        : DataRequest.fromJson(
            json['pemberian_daerah'] as Map<String, dynamic>),
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
      'umur_dalam_hari': instance.umurDalamHari,
      'diameter_kepala': instance.diameterKepala,
      'vitamin_a': instance.vitaminA,
      'asi_bulan_1': instance.asi1,
      'asi_bulan_2': instance.asi2,
      'asi_bulan_3': instance.asi3,
      'asi_bulan_4': instance.asi4,
      'asi_bulan_5': instance.asi5,
      'asi_bulan_6': instance.asi6,
      'pemberian_ke': instance.pemberianKe,
      'sumber_pmt': instance.sumberPmt,
      'pemberian_pusat': instance.pemberianPusat,
      'tahun_produksi': instance.tahunProduksi,
      'pemberian_daerah': instance.pemberianDaerah,
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
