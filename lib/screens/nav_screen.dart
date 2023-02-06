import 'package:flutter/material.dart';
import 'package:flutter_facebook/screens/home_screen.dart';
import 'package:flutter_facebook/widgets/custom_tab_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();

  final List<Widget> _screens = [
    const HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedIndex = 0;
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget._screens.length,
        child: Scaffold(
          body: widget._screens[widget._selectedIndex],
          bottomNavigationBar: CustomTabBar(
            icons: widget._icons,
            tabIndex: widget._selectedIndex,
            onTap: (index) => {
              setState(() => {widget._selectedIndex = index})
            },
          ),
        ));
  }
}
