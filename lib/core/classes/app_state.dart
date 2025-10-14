sealed class AppState<T> {}

class DataState<T> implements AppState<T> {
  final T value;
  const DataState({required this.value});
}

class ErrorState<T> implements AppState<T> {}

class LoadingState<T> implements AppState<T> {}
