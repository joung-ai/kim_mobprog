# kim_mobprog

A simple Facebook newsfeed made with Flutter.

## Lab Activity 1: discussion

**How did I integrate the Image to `newsfeed_card.dart` and make it dynamic whether it has an image or not?**

I made a widget called `PostImage` that shows a picture using `Image.asset()`.

In `newsfeed_card.dart`, I added an `imagePath` to each post. If a post has an `imagePath`, the image is shown. If it doesn't, nothing is shown:

```dart
if (widget.imagePath != null)
  PostImage(imagePath: widget.imagePath!),
```

So a post with a picture shows the image, and a text-only post just shows the text.

## Enhancements

1. **Image widget** – `PostImage` shows the post's picture.
2. **Avatar** – `UserAvatar` shows the user's profile picture, or their first letter if they have none.
3. **Like and Comment buttons** – `PostActionButton` is one widget used for the Like, Comment and Share buttons. Tapping Like adds 1 to the likes.
