import 'dart:convert';

import 'package:simpati/core/domain/model/child_info.dart';
import 'package:simpati/core/domain/model/mother.dart';
import 'package:simpati/core/domain/model/mother_info.dart';
import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;
import 'package:simpati/feature/repository/mother_repository.dart';

class MotherRepositoryImpl extends MotherRepository {
  final _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  static void register() {
    Get.put<MotherRepository>(
      MotherRepositoryImpl(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  @override
  Future<Result<MotherN>> add(MotherN instance) async {
    final motherRequest = MotherN().motherToMotherRequest(instance);
    return await Api.v1
        .post(
      "/klaster-by-member-record-add/posyandu/ibu",
      data: ([motherRequest.toJson()]),
    )
        .withParser(
      (json) {
        print(json);
        final data = json["data"];
        if (data is List && data.isNotEmpty) {
          print(data);
          // return Result.success(data, json);
          return true;
        }
        return Result.error(MessageFailure("Gagal input silahkan coba lagi"));
      },
    ).withLoading();
  }

  @override
  Future<Result<bool>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteByKey(ins) {
    // TODO: implement deleteByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<MotherN>> edit(MotherN instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<List<MotherN>>> getAll() async {
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "ibu",
        "simple": true,
        "limit": -1
      },
    ).withParser((json) {
      return ResponseMother.fromJson(json).mapToMothers();
    }, errorParser: (json) {}
        // errorOr: () =>
        //     Result<Mother>.error(MessageFailure("something went wrong..")),
        );
  }

  @override
  Future<Result<MotherN>> getByKey(ins) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<MotherInfo>> getMotherById(String id) async {
    return await Api.v1.get(
      "/klaster-by-member-relation-child",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "ibu",
        "klaster_record_id": id,
        "klaster_slug_child": "kehamilan",
        "simple": true
      },
    ).withParser(
      (json) {
        return MotherInfo.fromJson(json);
      },
      errorParser: (json) {
        return json;
      },
    );
  }

  @override
  Future<Result<ChildInfo>> getChildByIdMother(String id) async {
    return await Api.v1.get(
      "/klaster-by-member-relation-child",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "ibu",
        "klaster_record_id": id,
        "klaster_slug_child": "anak",
        "simple": true
      },
    ).withParser(
      (json) {
        return ChildInfo.fromJson(json);
      },
      errorParser: (json) {
        return json;
      },
    );
  }
}
