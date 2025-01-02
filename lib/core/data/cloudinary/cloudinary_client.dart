import 'package:cloudinary/cloudinary.dart';
import 'package:poster/core/data/env/env.dart';

Cloudinary createCloudinaryClient() =>
  Cloudinary.unsignedConfig(cloudName: Env.cloudinaryCloudName);
