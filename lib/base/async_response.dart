abstract class AsyncResponse<T> {
  AsyncResponse();
}

class Init extends AsyncResponse{
  Init();
}

class Loading extends AsyncResponse{
  Loading();
}

class Success<T> extends AsyncResponse<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends AsyncResponse<T> {
  final String message;
  Error(this.message);
}
