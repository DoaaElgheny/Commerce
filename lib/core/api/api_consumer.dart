abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters,bool isToken});
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,Map<String, dynamic>? queryParameters,bool isFormData,isToken});
  Future<dynamic> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters,bool isToken});
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters,bool isToken});
}