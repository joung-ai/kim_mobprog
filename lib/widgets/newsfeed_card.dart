import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kim_mobprog/constants.dart';
import 'package:kim_mobprog/widgets/custom_text.dart';
import 'package:kim_mobprog/widgets/post_action_button.dart';
import 'package:kim_mobprog/widgets/post_image.dart';
import 'package:kim_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? numOfLikes;
  final int? numOfComments;
  final int? numOfShares;
  // Post image: leave null for a text-only post.
  final String? imagePath;
  // Profile picture: leave null to show the user's initial.
  final String? profileImagePath;
  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.numOfComments,
    this.numOfShares,
    this.imagePath,
    this.profileImagePath,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  bool _isLiked = false;
  late int _likeCount = widget.numOfLikes ?? 0;

  void _onLikePressed() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);
    final actionColor = Colors.grey[700]!;

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Enhancement 2: avatar for the user profile image
                UserAvatar(
                  name: widget.userName,
                  imagePath: widget.profileImagePath,
                ),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: widget.date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // post Content
            CustomText(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // Enhancement 1: image area is shown only when the post has an image
            if (widget.imagePath != null)
              PostImage(imagePath: widget.imagePath!),

            // Number of likes, comments and shares
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setSp(9),
                    backgroundColor: fbPrimary,
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: ScreenUtil().setSp(10),
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(5)),
                  CustomText(
                    text: _likeCount.toString(),
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey[700]!,
                  ),
                  Spacer(),
                  CustomText(
                    text:
                        '${widget.numOfComments ?? 0} Comments  ${widget.numOfShares ?? 0} Shares',
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey[700]!,
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[300]),

            // Enhancement 3: widget-based Like, Comment and Share buttons
            Row(
              children: [
                Expanded(
                  child: PostActionButton(
                    icon: _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    label: 'Like',
                    color: _isLiked ? fbPrimary : actionColor,
                    onPressed: _onLikePressed,
                  ),
                ),
                Expanded(
                  child: PostActionButton(
                    icon: Icons.chat_bubble_outline,
                    label: 'Comment',
                    color: actionColor,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: PostActionButton(
                    icon: Icons.redo,
                    label: 'Share',
                    color: actionColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Divider(height: 1, color: Colors.grey[300]),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Row(
              children: [
                UserAvatar(name: 'You', radius: 14),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(10),
                      0,
                      0,
                      0,
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(10)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
