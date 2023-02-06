import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/constants/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  final bool isCurrentUser;

  const Stories(
      {Key? key,
      required this.currentUser,
      required this.stories,
      this.isCurrentUser = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemCount: stories.length,
          itemBuilder: (BuildContext context, index) {
            final story = stories[index];
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _StoryCard(
                      story: story,
                      currentUser: currentUser,
                      isCurrentUser: true,
                    ))
                : Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _StoryCard(story: story, currentUser: currentUser));
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool? isCurrentUser;
  final Story story;
  final User currentUser;

  const _StoryCard(
      {Key? key,
      this.isCurrentUser = false,
      required this.story,
      required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
              imageUrl: isCurrentUser! ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover),
        ),
        Container(
          width: 110,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isCurrentUser!
                ? Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Palette.facebookBlue,
                          onPressed: () => {},
                        )),
                  )
                : ProfileAvatar(
                    imageUrl: story.imageUrl,
                    hasBorder: true,
                    borderColor: !story.isViewed
                        ? Palette.facebookBlue
                        : Colors.grey[500],
                  )),
        Positioned(
            bottom: 8,
            left: 8,
            child: Text(isCurrentUser! ? 'Add to story' : story.user.name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
