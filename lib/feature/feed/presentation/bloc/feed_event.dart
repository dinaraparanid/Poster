sealed class FeedEvent {}

final class Create extends FeedEvent {}

final class Refresh extends FeedEvent {}

final class Like extends FeedEvent {
  final String postId;
  Like({required this.postId});
}
