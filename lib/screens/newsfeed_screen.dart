
import 'package:kim_mobprog/widgets/newsfeed_card.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Alberto Konsehal',
          postContent: 'Longanissa for sale #RespectMyPost',
          date: '2 hours ago',
          numOfLikes: 100,
        ),
        NewsfeedCard(
          userName: 'Aling Nena',
          postContent: 'Pusa ko oh',
          date: 'December 1, 2023',
          numOfLikes: 300,
          hasImage: true,
        ),
      ],
    );
  }
}
