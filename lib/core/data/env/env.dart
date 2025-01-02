import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
final class Env {
  @EnviedField(varName: 'CLOUDINARY_CLOUD_NAME', obfuscate: true, defaultValue: 'placeholder')
  static final String cloudinaryCloudName = _Env.cloudinaryCloudName;

  @EnviedField(varName: 'CLOUDINARY_UPLOAD_PRESET', obfuscate: true, defaultValue: 'placeholder')
  static final String cloudinaryUploadPreset = _Env.cloudinaryUploadPreset;
}
