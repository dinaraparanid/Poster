import 'dart:math';
import 'package:poster/core/domain/paging/paging_config.dart';

final class PagingUtils {
  PagingUtils._();

  static int pageOffset({required int page, required int perPage}) {
    assert(page >= PagingConfig.initialPage);
    return page * perPage;
  }

  static int pageSizeWithNext({required int perPage}) => perPage + 1;

  static int? previousPage({required int page}) {
    assert(page >= PagingConfig.initialPage);
    return page == PagingConfig.initialPage ? null : page - 1;
  }

  static int? nextPage({
    required int page,
    required int perPage,
    required int entitiesSize,
  }) {
    assert(page >= PagingConfig.initialPage);
    return entitiesSize > perPage ? page + 1 : null;
  }
}
