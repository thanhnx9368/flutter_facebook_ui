import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook/constants/palette.dart';
import 'package:flutter_facebook/constants/dimension.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/widgets/PostContainer.dart';
import 'package:flutter_facebook/widgets/create_post_container.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';
import 'package:flutter_facebook/widgets/rooms.dart';
import 'package:flutter_facebook/widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _trackingScrollController,
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            title: const Text(
              'Facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              _CircleButton(
                icon: Icons.search,
                onPressed: () => print('Search'),
                iconSize: 24,
              ),
              const SizedBox(width: kDefaultPadding),
              _CircleButton(
                icon: Icons.message_rounded,
                onPressed: () => print('Message'),
                iconSize: 24,
              ),
            ]),
        const SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
          sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
          sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories)),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return PostContainer(post: posts[index]);
          },
          childCount: posts.length,
        ))
      ],
    ));
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;

  const _CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
        child: IconButton(
          onPressed: onPressed(),
          icon: Icon(icon),
          iconSize: iconSize,
        ));

    // return const IconButton(onPressed: null, icon: Icon(Icons.search));
  }
}
