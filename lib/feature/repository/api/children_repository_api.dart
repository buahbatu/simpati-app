import 'dart:io';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/model/children_check.dart';
import 'package:simpati/feature/repository/children_repository.dart';

class ChildrenRepositoryApi extends ChildrenRepository {
  static void register() {
    Get.put<ChildrenRepository>(
      ChildrenRepositoryApi(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  @override
  Future<Result<Children>> getByKey(ins) async {
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "anak",
        "klaster_record_id": ins,
        "simple": true
      },
    ).withParser(
      (json) {
        return ResponseChildren.fromJson(json).mapToChild();
      },
      errorParser: (json) {
        return json;
      },
    );
  }

  @override
  Future<Result<Children>> add(Children instance) async {
    final childBody = instance.toRequestBody();
    return await Api.v1
        .post("/klaster-by-member-record-add/posyandu/anak",
            data: ([childBody.toJson()]))
        .withParser((json) {
      final data = json['data'];
      print(data);
      if (data is List && data.isNotEmpty) {
        return instance;
      } else {
        throw (TypeError());
      }
    }, errorOr: () {
      return Result.error(MessageFailure("Gagal memasukan data"));
    }).withLoading();
  }

  @override
  Future<Result<bool>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteByKey(key) {
    // TODO: implement deleteByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<Children>> edit(Children instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Children>>> getAll() async {
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "anak",
        "simple": true,
        "limit": -1
      },
    ).withParser((json) {
      return ResponseChildren.fromJson(json).mapToChildren();
    }, errorParser: (json) {
      return json;
    });
  }

  @override
  Future<Result<List<ChildMedicalCheckup>>> getChildMedicalCheck(
      String id) async {
    return await Api.v1.get(
      "/klaster-by-member-relation-child",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "anak",
        "klaster_record_id": id,
        "simple": true,
        "klaster_slug_child": "anak-cek",
        "limit": -1
      },
    ).withParser((json) {
      return CheckChildResponse.fromJson(json).mapToChildCheck();
    }, errorParser: (json) {
      return json;
    });
  }

  @override
  Future<Result<ChildMedicalCheckup>> addChildMedicalCheckUp(
      ChildMedicalCheckup medCheck) async {
    final medReq = ChildMedicalCheckup().medChildRequest(medCheck);
    print(medReq.toString());
    return await Api.v1
        .post(
      "/klaster-by-member-record-add/posyandu/anak-cek",
      data: ([medReq.toJson()]),
    )
        .withParser((json) {
      print(json);
      final data = json["data"];
      if (data is List && data.isNotEmpty) {
        print(data);
        return medCheck;
      } else {
        throw (TypeError());
      }
    }, errorOr: () {
      return Result.error(MessageFailure("Gagal input silahkan coba lagi"));
    }).withLoading();
  }
}
