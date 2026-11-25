
import 'package:kim_mobprog/widgets/newsfeed_card.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Text-only post: no imagePath, so no image area is drawn
        NewsfeedCard(
          userName: 'Alberto Konsehal',
          postContent: 'Longanissa for sale #RespectMyPost',
          date: '2 hours ago',
          numOfLikes: 100,
          numOfComments: 12,
          numOfShares: 3,
          profileImagePath: 'assets/images/bbm.jpg',
        ),
        // Post with an image: passing imagePath shows the PostImage widget
        NewsfeedCard(
          userName: 'Aling Nena',
          postContent: 'Pusa ko oh',
          date: 'December 1, 2023',
          numOfLikes: 300,
          numOfComments: 42,
          numOfShares: 5,
          imagePath: 'assets/images/kooki.jpg',
          profileImagePath: 'assets/images/sara.jpg',
        ),
      ],
    );
  }
}
