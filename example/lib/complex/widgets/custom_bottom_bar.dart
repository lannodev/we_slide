import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Function onTap;
  final int selectedIndex;

  const CustomBottomBar({
    Key key,
    @required this.onTap,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('EXPLORE'),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            title: Text('FAVORITES'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('SEARCH'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('LIBRARY'),
          ),
        ],
        elevation: 0,
        currentIndex: selectedIndex,
        backgroundColor: colorScheme.surface,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        selectedItemColor: colorScheme.primary,
        unselectedFontSize: 10,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.3),
        onTap: onTap,
      ),
    );
  }
}
