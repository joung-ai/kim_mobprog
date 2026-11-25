import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kim_mobprog/constants.dart';
import 'package:kim_mobprog/widgets/custom_text.dart';
import 'package:material_ui/material_ui.dart';

/// Enhancement 2: avatar for the user profile image.
/// Shows the profile picture when one is given, otherwise the user's initial.
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.imagePath,
    this.radius = 18,
  });

  final String name;
  final String? imagePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil().setSp(radius);

    if (imagePath != null) {
      return CircleAvatar(
        radius: size,
        backgroundColor: fbLightPrimary,
        backgroundImage: AssetImage(imagePath!),
      );
    }

    return CircleAvatar(
      radius: size,
      backgroundColor: fbLightPrimary,
      child: CustomText(
        text: name.isNotEmpty ? name[0].toUpperCase() : '?',
        fontSize: size,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
