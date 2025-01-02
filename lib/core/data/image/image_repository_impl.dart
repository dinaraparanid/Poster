import 'package:cloudinary/cloudinary.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poster/core/data/env/env.dart';
import 'package:poster/core/domain/image/image_repository.dart';

final class ImageRepositoryImpl extends ImageRepository {
  final Cloudinary _client;
  ImageRepositoryImpl({required Cloudinary client}) : _client = client;

  @override
  Future<Either<Exception, String>> upload(XFile file) async {
    final response = await _client.unsignedUpload(
      file: file.path,
      uploadPreset: Env.cloudinaryUploadPreset,
      fileBytes: await file.readAsBytes(),
      fileName: file.name,
      resourceType: CloudinaryResourceType.image,
    );

    final url = response.secureUrl;

    if (response.isSuccessful && url != null) {
      return Either.right(url);
    }

    return Either.left(Exception(
      'Error uploading image: ${response.statusCode} - ${response.error}'
    ));
  }
}
