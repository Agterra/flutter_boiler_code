// /// UseCase Return State statuses
enum StateStatus { success, failure }

/// UseCase Return State with custom exception
class ResultState<T> {
  final T? data;
  final Exception? exception;
  final StateStatus status;

  const ResultState._({this.data, this.exception, required this.status});

  factory ResultState.success(T data) =>
      ResultState<T>._(data: data, status: StateStatus.success);

  factory ResultState.failure(Exception exception) =>
      ResultState<T>._(exception: exception, status: StateStatus.failure);

  R? when<R>({
    R Function(T data)? success,
    R Function(Exception exception)? failure,
  }) {
    switch (status) {
      case StateStatus.success:
        return success != null ? success(data as T) : null;
      case StateStatus.failure:
        return failure != null ? failure(exception as Exception) : null;
    }
  }
}
