class ApiResult {}

class Success<T> extends ApiResult{
  final T data;
  Success(this.data);
}

class Error extends ApiResult{
  String message;
  Error(this.message);
}
