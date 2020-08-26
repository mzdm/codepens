import 'package:flutter/material.dart';
import 'package:music_album_stats/models/song.dart';
import 'package:music_album_stats/utils/colors.dart';

class RecommendedListTile extends StatefulWidget {
  RecommendedListTile({
    this.isFavoritePage = false,
    @required this.songItem,
    this.onPressed,
  }) : assert(songItem != null);

  final bool isFavoritePage;
  final Song songItem;
  final VoidCallback onPressed;

  @override
  _RecommendedListTileState createState() => _RecommendedListTileState();
}

class _RecommendedListTileState extends State<RecommendedListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        onTap: () {},
        contentPadding: widget.isFavoritePage
            ? const EdgeInsets.symmetric(horizontal: 14.0)
            : const EdgeInsets.symmetric(horizontal: 8.0),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: widget.songItem.assetName != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.songItem.assetUrl),
//                        image: AssetImage('network_images/${widget.songItem.assetName}'),
                      ),
                    )
                  : ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[
                          ColorsUtils.orange,
                          ColorsUtils.pink,
                        ],
                      ),
                    ),
            ),
            if (!widget.isFavoritePage)
              Icon(
                Icons.music_note,
                color: Colors.white.withOpacity(0.85),
                size: 33.0,
              ),
          ],
        ),
        title: Text(widget.songItem.song),
        subtitle: Text(widget.songItem.artist),
        trailing: widget.isFavoritePage
            ? IconButton(
                icon: Icon(Icons.favorite, color: ColorsUtils.pink),
                onPressed: widget.onPressed,
              )
            : Icon(Icons.chevron_right),
      ),
    );
  }
}
