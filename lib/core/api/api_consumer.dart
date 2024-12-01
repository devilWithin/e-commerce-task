typedef UploadProgressCallback = void Function(int sent, int total);

abstract class ApiConsumer {
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParams,
  });

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? queryParams,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  });

  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? queryParams,
  });

  Future<ApiResponse> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<ApiResponse> uploadFile({
    required String path,
    required String filePath,
    required String fileName,
    Map<String, dynamic>? data,
    required UploadProgressCallback onProgress,
  });
}

class ApiResponse {
  final dynamic data;
  final int statusCode;

  ApiResponse({
    required this.data,
    required this.statusCode,
  });
}
