import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';

class Posyandu extends Equatable implements Data {
  final String posyandu_id;
  final String posyandu_name;
  final String wilayah;
  final String kecamatan_id;
  final String kab_kota_id;
  final String provinsi_id;
  final String kelurahan_desa_id;
  final String rw;
  final String alamat_lengkap;
  final String contact_name;
  final String contact_handphone;
  final String contact_email;
  final String picture;
  final String admin_id;

  Posyandu({
    this.posyandu_id,
    this.posyandu_name,
    this.wilayah,
    this.kecamatan_id,
    this.kab_kota_id,
    this.provinsi_id,
    this.kelurahan_desa_id,
    this.rw,
    this.alamat_lengkap,
    this.contact_name,
    this.contact_handphone,
    this.contact_email,
    this.picture,
    this.admin_id,
  });

  Posyandu copyWith({
    String posyandu_id,
    String posyandu_name,
    String wilayah,
    String kecamatan_id,
    String kab_kota_id,
    String provinsi_id,
    String kelurahan_desa_id,
    String rw,
    String alamat_lengkap,
    String contact_name,
    String contact_handphone,
    String contact_email,
    String picture,
    String admin_id,
  }) {
    return Posyandu(
      posyandu_id: posyandu_id ?? this.posyandu_id,
      posyandu_name: posyandu_name ?? this.posyandu_name,
      wilayah: wilayah ?? this.wilayah,
      kecamatan_id: kecamatan_id ?? this.kecamatan_id,
      kab_kota_id: kab_kota_id ?? this.kab_kota_id,
      provinsi_id: provinsi_id ?? this.provinsi_id,
      kelurahan_desa_id: kelurahan_desa_id ?? this.kelurahan_desa_id,
      rw: rw ?? this.rw,
      alamat_lengkap: alamat_lengkap ?? this.alamat_lengkap,
      contact_name: contact_name ?? this.contact_name,
      contact_handphone: contact_handphone ?? this.contact_handphone,
      contact_email: contact_email ?? this.contact_email,
      picture: picture ?? this.picture,
      admin_id: admin_id ?? this.admin_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'posyandu_id': posyandu_id,
      'posyandu_name': posyandu_name,
      'wilayah': wilayah,
      'kecamatan_id': kecamatan_id,
      'kab_kota_id': kab_kota_id,
      'provinsi_id': provinsi_id,
      'kelurahan_desa_id': kelurahan_desa_id,
      'rw': rw,
      'alamat_lengkap': alamat_lengkap,
      'contact_name': contact_name,
      'contact_handphone': contact_handphone,
      'contact_email': contact_email,
      'picture': picture,
      'admin_id': admin_id,
    };
  }

  static Posyandu fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Posyandu(
      posyandu_id: map['posyandu_id'],
      posyandu_name: map['posyandu_name'],
      wilayah: map['wilayah'],
      kecamatan_id: map['kecamatan_id'],
      kab_kota_id: map['kab_kota_id'],
      provinsi_id: map['provinsi_id'],
      kelurahan_desa_id: map['kelurahan_desa_id'],
      rw: map['rw'],
      alamat_lengkap: map['alamat_lengkap'],
      contact_name: map['contact_name'],
      contact_handphone: map['contact_handphone'],
      contact_email: map['contact_email'],
      picture: map['picture'],
      admin_id: map['admin_id'],
    );
  }

  @override
  List<Object> get props => [
        this.posyandu_id,
        this.posyandu_name,
        this.wilayah,
        this.kecamatan_id,
        this.kab_kota_id,
        this.provinsi_id,
        this.kelurahan_desa_id,
        this.rw,
        this.alamat_lengkap,
        this.contact_name,
        this.contact_handphone,
        this.contact_email,
        this.picture,
        this.admin_id
      ];
}
