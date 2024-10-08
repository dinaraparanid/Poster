import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/profile_cover_stub.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/wall/presentation/ui/profile/info.dart';

final class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return Padding(
      padding: EdgeInsets.only(top: theme.dimensions.padding.extraSmall),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: theme.dimensions.padding.enormous),
              child: const ProfileInfo(),
            ),
          ),

          ProfileCoverStub(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(theme.dimensions.radius.small)
            ),
            color: theme.colors.background.avatarPlaceholder,
            containerSize: Size(
              theme.dimensions.size.large,
              theme.dimensions.size.large
            ),
            avatarSize: Size(
              theme.dimensions.size.extraBig,
              theme.dimensions.size.extraBig,
            ),
            shadow: BoxShadow(
              color: theme.colors.shadow,
              blurRadius: theme.dimensions.radius.minimum,
              offset: theme.dimensions.offset.shadow,
            ),
          ),
        ],
      ),
    );
  }
}
