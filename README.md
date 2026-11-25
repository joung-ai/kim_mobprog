# kim_mobprog

A Facebook newsfeed replication built with Flutter and `flutter_screenutil`.

## Lab Activity 1: discussion

**Laboratory Discussion: How did you integrate the Image to the `newsfeed_card.dart` and make it dynamic whether it has image or not?**

In the original code, `newsfeed_card.dart` used a `bool? hasImage` and a hard-coded `AssetImage` path, so every post with an image could only show the same picture. To fix this, I replaced `hasImage` with an optional `String? imagePath` property on `NewsfeedCard`. Each post now passes its own image path from `newsfeed_screen.dart`, or leaves it out if it is a text-only post.

I moved the image area into its own reusable widget, `PostImage` (`lib/widgets/post_image.dart`). It uses the `Image` class through `Image.asset()` to load the picture from `assets/images/`. It sets `width: double.infinity` and `fit: BoxFit.cover` so the image fills the card's width, and a fixed height from `ScreenUtil().setHeight(250)` so it scales on different screen sizes. I wrapped it in a `ClipRRect` for rounded corners and added an `errorBuilder`, so a missing file shows a grey placeholder instead of crashing the app.

To make it dynamic, `newsfeed_card.dart` uses a collection `if` inside the `Column`:

```dart
if (widget.imagePath != null)
  PostImage(imagePath: widget.imagePath!),
```

If the post has an `imagePath`, the `PostImage` widget is added to the card. If it is `null`, nothing is added at all, so the card shrinks to fit only the text and no empty space is left behind. Because the asset folder is already registered in `pubspec.yaml` (`assets/images/`), any image placed there can be used by passing its path.

### Other enhancements

- **Avatar for the user profile image:** `UserAvatar` (`lib/widgets/user_avatar.dart`) uses a `CircleAvatar`. It shows the profile picture when `profileImagePath` is given, and the user's first initial when it is not. It replaces the plain `Icon(Icons.person)` in the post header and in the comment box.
- **Widget-based Like and Comment buttons:** `PostActionButton` (`lib/widgets/post_action_button.dart`) is one reusable button used for Like, Comment and Share. `NewsfeedCard` is now a `StatefulWidget`, so tapping Like toggles the icon and colour and adds or removes one from the like count, which is shown above the buttons along with the number of comments and shares.
