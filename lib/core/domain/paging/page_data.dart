import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_data.freezed.dart';

@freezed
abstract class PageData<K, V> with _$PageData<K, V> {
  const factory PageData({
    required List<V> data,
    K? next,
    K? prev,
  }) = _PageData;
}
