class CustomResponse<T> {
  T? errorResponse;
  T? successResponse;

  CustomResponse({
    this.errorResponse,
    this.successResponse,
  });
}