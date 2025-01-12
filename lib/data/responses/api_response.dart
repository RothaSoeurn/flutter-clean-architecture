class ApiResponse<T> {
  final String? status;
  final String message;
  final T record;
  final int currentPage;
  final int lastPage;

  ApiResponse({
    required this.status,
    this.message = "",
    required this.record,
    this.currentPage = 1,
    this.lastPage = 1,
  });
}
