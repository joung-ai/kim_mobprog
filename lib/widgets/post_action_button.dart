import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kim_mobprog/widgets/custom_text.dart';
import 'package:material_ui/material_ui.dart';

/// Enhancement 3: one reusable widget for the Like, Comment and Share buttons.
class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: ScreenUtil().setSp(18)),
      label: CustomText(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
