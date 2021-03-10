import 'model/playlist.dart';
import 'package:flutter/material.dart';

import 'playlist_type.dart';

class PlaylistItem extends StatefulWidget {
  PlaylistItem({Key? key, required this.playlist, this.small = false})
      : super(key: key);

  final Playlist playlist;
  final bool small;

  @override
  _PlaylistItemState createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: widget.playlist.type == PlaylistType.ARTIST
                ? Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(widget.playlist.image,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(widget.playlist.name,
                          style: TextStyle(
                              color: colorTheme.onPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 20))
                    ],
                  )
                : Text(
                    widget.playlist.name,
                    style: TextStyle(
                        color: colorTheme.onPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: widget.small ? 130.0 : 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: widget.playlist.musicList.length,
              itemBuilder: (context, index) {
                final item = widget.playlist.musicList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: widget.small ? 100 : 150,
                      width: widget.small ? 100 : 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(item.albumCover, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    if (widget.small)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          width: widget.small ? 100 : 150,
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: colorTheme.onPrimary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    if (!widget.small)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          width: widget.small ? 100 : 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: colorTheme.onPrimary,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 5.0),
                              Text(item.artist,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:
                                          colorTheme.onPrimary.withOpacity(0.5),
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
