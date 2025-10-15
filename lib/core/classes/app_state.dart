sealed class AppState<T> {
  final T? data;
  const AppState(this.data);
}

class DataState<T> extends AppState<T> {
  final T value;
  const DataState({required this.value}) : super(value);
}

class ErrorState<T> extends AppState<T> {
  const ErrorState() : super(null);
}

class LoadingState<T> extends AppState<T> {
  const LoadingState() : super(null);
}
