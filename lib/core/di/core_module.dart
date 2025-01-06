import 'package:get_it/get_it.dart';
import 'package:poster/core/data/cloudinary/di/cloudinary_module.dart';
import 'package:poster/core/data/dio/di/dio_module.dart';
import 'package:poster/core/data/firebase/di/firebase_module.dart';
import 'package:poster/core/data/image/di/image_module.dart';
import 'package:poster/core/data/post/di/post_module.dart';
import 'package:poster/core/data/profile/di/profile_module.dart';

extension CoreModule on GetIt {
  List<Type> registerCoreModule() => [
    ...registerProfileModule(),
    ...registerCloudinaryModule(),
    ...registerImageModule(),
    ...registerPostModule(),
    ...registerFirebaseModule(),
    ...registerDio(),
  ];
}
