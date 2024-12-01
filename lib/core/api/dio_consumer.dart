import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:fudex_test/core/api/api_consumer.dart';
import 'package:fudex_test/core/api/app_interceptor.dart';
import 'package:fudex_test/core/api/end_points.dart';
import 'package:fudex_test/core/api/status_code.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/injection_container.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter)
        .createHttpClient = () => HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true;
      };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    client.interceptors.add(sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(sl<LogInterceptor>());
    }
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParams,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? queryParams,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(
        path,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
        queryParameters: queryParams,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<ApiResponse> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.patch(
        path,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
        queryParameters: queryParams,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParams,
        data: body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  ApiResponse _handleResponseAsJson(Response<dynamic> response) {
    try {
      final responseJson = jsonDecode(response.data.toString());
      return ApiResponse(data: responseJson, statusCode: response.statusCode!);
    } catch (e) {
      return ApiResponse(data: null, statusCode: response.statusCode!);
    }
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
    }
  }

  @override
  Future<ApiResponse> uploadFile({
    required String path,
    required String filePath,
    Map<String, dynamic>? data,
    required String fileName,
    required UploadProgressCallback onProgress,
  }) async {
    try {
      final file = await MultipartFile.fromFile(
        filePath,
      );

      final formData = FormData.fromMap({
        fileName: file,
        ...data ?? {},
      });

      log(formData.fields.toString());

      final response = await client.post(
        onSendProgress: onProgress,
        path,
        data: formData,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<ApiResponse> delete(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParams,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }
}
