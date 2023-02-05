import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';

import '../constants/dimension.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(
            kDefaultPadding, 8.0, 12.0, kDefaultPadding),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                  hasBorder: false,
                ),
                const SizedBox(width: 8.0),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            const Divider(height: 10.0, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () => print('ok'),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text('Like')),
                TextButton.icon(
                    onPressed: () => print('ok'),
                    icon: const Icon(Icons.photo_library, color: Colors.green),
                    label: const Text('Photos')),
                TextButton.icon(
                    onPressed: () => print('ok'),
                    icon: const Icon(Icons.video_call, color: Colors.purple),
                    label: const Text('Room')),
              ],
            )
          ],
        ));
  }
}
