import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageRepository {
  Future<Either<Exception, String>> upload(XFile file);
}
