sealed class WallEvent {}

final class Create extends WallEvent {}

final class Refresh extends WallEvent {}

final class Like extends WallEvent {
  final String postId;
  Like({required this.postId});
}
