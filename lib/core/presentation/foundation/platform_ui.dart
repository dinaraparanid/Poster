import 'package:universal_platform/universal_platform.dart';

U PlatformUi<U>({required U cupertino, required U material}) =>
    UniversalPlatform.isIOS || UniversalPlatform.isMacOS ? cupertino : material;
