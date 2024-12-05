class ApiResponse<T> {
  final bool succeeded;
  final String message;
  final List<String> errors;
   var data;

  ApiResponse({
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
  });

  // Factory method to create an instance from JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String,
      errors: List<String>.from(json['errors']),
      data:json['data'] ,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'succeeded': succeeded,
      'message': message,
      'errors': errors,
      'data': (data),
    };
  }
}
