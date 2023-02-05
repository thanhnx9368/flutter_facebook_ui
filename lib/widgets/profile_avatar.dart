import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/constants/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool? active;
  final bool? hasBorder;

  const ProfileAvatar(
      {Key? key,
      required this.imageUrl,
      this.active = false,
      this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
            radius: 20.0,
            backgroundColor: Palette.facebookBlue,
            child: CircleAvatar(
              radius: hasBorder! ? 18 : 20.0,
              backgroundImage: CachedNetworkImageProvider(imageUrl, scale: 1.0),
            )),
        active!
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                ))
            : SizedBox.shrink()
      ],
    );
  }
}
