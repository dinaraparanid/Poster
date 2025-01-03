import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_data.freezed.dart';

@freezed
abstract class PageData<T> with _$PageData<T> {
  const factory PageData({
    required List<T> data,
    int? next,
    int? prev,
  }) = _PageData;
}
