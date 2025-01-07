import 'package:hive_ce/hive.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_utils.dart';

extension HivePaging<T> on Box<T> {
  PageData<T> pageAt({
    required int page,
    required int perPage,
  }) {
    final entities = values
      .skip(PagingUtils.pageOffset(page: page, perPage: perPage))
      .take(PagingUtils.pageSizeWithNext(perPage: perPage))
      .toList(growable: false);

    final prev = PagingUtils.previousPage(page: page);

    final next = PagingUtils.nextPage(
      page: page,
      perPage: perPage,
      entitiesSize: entities.length,
    );

    return PageData(data: entities, prev: prev, next: next);
  }
}