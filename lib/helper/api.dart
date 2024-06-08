import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Api {
  Future<dynamic> get(
      {required String uri, @required String? tokenAuth}) async {
    Map<String, String> headersQuery = {};
    if (tokenAuth != null) {
      headersQuery.addAll({
        'Authorization': 'Bearer $tokenAuth',
      });
    }
    Response response = await Dio().get(
      Uri.parse(uri).toString(),
      queryParameters: headersQuery,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        'there was an error in the status code: ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String uri,
    @required dynamic bodyData,
    @required String? tokenAuth,
  }) async {
    Map<String, String> headersQuery = {};
    if (tokenAuth != null) {
      headersQuery.addAll({
        'Authorization': 'Bearer $tokenAuth',
      });
    }
    Response response = await Dio().post(
      Uri.parse(uri).toString(),
      data: bodyData,
      queryParameters: headersQuery,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        'there was an error status code : ${response.statusCode} with body : ${response.data}',
      );
    }
  }

  Future<dynamic> put({
    required String uri,
    @required dynamic bodyData,
    @required String? tokenAuth,
  }) async {
    Map<String, String> headersQuery = {};
    headersQuery.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (tokenAuth != null) {
      headersQuery.addAll({
        'Authorization': 'Bearer $tokenAuth',
      });
    }
    log('url : $uri ,body: $bodyData , token: $tokenAuth');
    Response response = await Dio().put(
      Uri.parse(uri).toString(),
      data: bodyData,
      queryParameters: headersQuery,
    );
    if (response.statusCode == 200) {
      log('response data: ${response.data}');
      return response.data;
    } else {
      throw Exception(
        'there was an error status code : ${response.statusCode} with body : ${response.data}',
      );
    }
  }
}
