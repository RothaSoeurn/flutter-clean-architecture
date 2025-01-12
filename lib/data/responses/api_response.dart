class ApiResponse<T> {
  final String? status;
  final String message;
  final T record;
  final int currentPage;
  final int lastPage;

  ApiResponse(
    this.status,
    this.message,
    this.record,
    this.currentPage,
    this.lastPage,
  );
}
