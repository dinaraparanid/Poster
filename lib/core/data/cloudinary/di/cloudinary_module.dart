import 'package:cloudinary/cloudinary.dart';
import 'package:get_it/get_it.dart';
import 'package:poster/core/data/cloudinary/cloudinary_client.dart';
import 'package:poster/core/di/provide_singleton.dart';

extension CloudinaryModule on GetIt {
  List<Type> registerCloudinaryModule() =>
    [provideSingleton<Cloudinary>(() => createCloudinaryClient())];
}
