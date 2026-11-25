# kim_mobprog

A simple Facebook newsfeed made with Flutter.

## Lab Activity 1: discussion

**How did I add the Image to newsfeed_card.dart and make it show only when a post has an image?**

I made a widget called PostImage that shows a picture using Image.asset.

Each post can have an imagePath. If the post has an imagePath, the picture is shown. If the post has no imagePath, no picture is shown and only the text appears.

## Enhancements

1. Image widget: PostImage shows the picture of the post.
2. Avatar: UserAvatar shows the profile picture of the user, or the first letter of the name if there is no picture.
3. Like and Comment buttons: PostActionButton is one widget used for the Like, Comment and Share buttons.
