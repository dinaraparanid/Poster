import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:super_paging/super_paging.dart';

extension LoadResultMapper<K, V> on Either<Exception, PageData<K, V>> {
  LoadResult<K, V> toLoadResult() => fold(
    (err) => LoadResult.error(err),
    (page) => LoadResult.page(
      items: page.data,
      prevKey: page.prev,
      nextKey: page.next,
    ),
  );
}