import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
sealed class UiState<T> {
  const factory UiState.initial() = Initial;
  const factory UiState.loading() = Loading;
  const factory UiState.refreshing({required UiState<T> value}) = Refreshing;
  const factory UiState.data({required T value}) = Data;
  const factory UiState.success() = Success;
  const factory UiState.error(Exception? e) = Error;
}

extension Properties<T> on UiState<T> {
  T? get getOrNull => switch (this) {
    Initial() => null,
    Loading() => null,
    Error() => null,
    Success() => null,
    Refreshing() => (this as Refreshing<T>).value.getOrNull,
    Data() => (this as Data<T>).value,
  };

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isError => this is Error;
  bool get isSuccess => this is Success;
  bool get isRefreshing => this is Refreshing;
  bool get isEvaluating => isInitial || isLoading || isRefreshing;
}

extension Mapper<T> on T {
  Data<T> toUiState() => Data(value: this);
}
