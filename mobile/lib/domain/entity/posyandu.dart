import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';

class Posyandu extends Equatable implements Data {
  final String id;
  final String fullName;
  final String alamat_lengkap;
  final String contact_name;
  final String contact_handphone;
  final String contact_email;
  final String picture;
  final String admin_id;

  Posyandu({
    this.id,
    this.fullName,
    this.alamat_lengkap,
    this.contact_name,
    this.contact_handphone,
    this.contact_email,
    this.picture,
    this.admin_id,
  });

  Posyandu copyWith({
    String id,
    String fullName,
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
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
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
      'id': id,
      'fullName': fullName,
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
      id: map['id'],
      fullName: map['fullName'],
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
        this.id,
        this.fullName,
        this.alamat_lengkap,
        this.contact_name,
        this.contact_handphone,
        this.contact_email,
        this.picture,
        this.admin_id
      ];
}
