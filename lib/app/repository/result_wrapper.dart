class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});

  bool get hasError => error != null;

  bool get hasData => data != null;
}
