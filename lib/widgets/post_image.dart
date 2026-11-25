import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

/// Enhancement 1: reusable widget for the image area of a post.
/// Uses the Image class (Image.asset) to load a picture from assets/images.
class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(5)),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: ScreenUtil().setHeight(250),
          fit: BoxFit.cover,
          // Shows a placeholder instead of crashing if the file is missing.
          errorBuilder: (context, error, stackTrace) => Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(250),
            color: Colors.grey[300],
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: ScreenUtil().setSp(40),
            ),
          ),
        ),
      ),
    );
  }
}
