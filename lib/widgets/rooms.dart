import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: ListView.builder(
        itemCount: onlineUsers.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _ButtonCreateRoom());
          }
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ProfileAvatar(
                imageUrl: onlineUsers[index].imageUrl, active: true),
          );
        },
      ),
    );
  }
}

class _ButtonCreateRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.white,
            side: BorderSide(
              width: 2.0,
              color: Colors.blueAccent.shade400,
              style: BorderStyle.solid,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12)),
        onPressed: () => {},
        child: Row(
          children: const [
            Icon(Icons.video_call),
            SizedBox(width: 4),
            Text('Create\nRoom')
          ],
        ));
  }
}
