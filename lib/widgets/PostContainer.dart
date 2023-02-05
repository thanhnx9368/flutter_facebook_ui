import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/constants/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _PostHeader(post: post)),
          const SizedBox(
            height: 4,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(post.caption)),
          post.imageUrl != ''
              ? const SizedBox.shrink()
              : const SizedBox(
                  height: 6,
                ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl))
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: _PostSats(
              post: post,
            ),
          ),
          const Divider(height: 2, thickness: 0.5),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: _PostActions(),
          )
        ],
      ),
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () => {},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  const Text('Like'),
                ]))),
        InkWell(
            onTap: () => {},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(MdiIcons.commentOutline, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  const Text('Comment'),
                ]))),
        InkWell(
            onTap: () => {},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(MdiIcons.shareOutline, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  const Text('Share'),
                ]))),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: post.user.imageUrl),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(children: [
                  Text('${post.timeAgo} * ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  Icon(Icons.public, color: Colors.grey[600], size: 12)
                ])
              ],
            )
          ],
        ),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostSats extends StatelessWidget {
  final Post post;
  const _PostSats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Palette.facebookBlue, shape: BoxShape.circle),
            child: const Icon(Icons.thumb_up, size: 12, color: Colors.white),
          ),
          const SizedBox(width: 4),
        ]),
        Expanded(
            child: Text(post.likes.toString(),
                style: TextStyle(color: Colors.grey[600]))),
        Row(children: [
          Text('${post.comments.toString()} Comments',
              style: TextStyle(color: Colors.grey[600])),
          const SizedBox(width: 4),
          Text(
            '${post.shares.toString()} Shares',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ])
      ],
    );
  }
}
