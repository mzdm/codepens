import 'package:flutter/material.dart';
import 'package:music_album_stats/data/favorites_provider.dart';
import 'package:music_album_stats/models/song.dart';
import 'package:music_album_stats/utils/colors.dart';
import 'package:music_album_stats/utils/utils.dart';

class SongPage extends StatefulWidget {
  SongPage({this.songItem});

  final Song songItem;

  static void create(
    BuildContext context, {
    @required Song song,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return SongPage(songItem: song);
            }
            return Scaffold(
              body: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(width: 200.0),
                  ),
                  Flexible(
                    flex: 4,
                    child: SongPage(songItem: song),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> with SingleTickerProviderStateMixin {
  var _totalViews = 0;

  @override
  void initState() {
    _increaseCounter(widget.songItem.views);
    super.initState();
  }

  void _increaseCounter(int maxValue) async {
    var startingValue = maxValue - ((maxValue * 0.000001).round());
    while (startingValue <= maxValue) {
      startingValue++;

      if (startingValue < maxValue) {
        await Future.delayed(Duration(microseconds: 10));
      } else {
        if (_totalViews != null) {
          setState(() => _totalViews = maxValue);
        }
        return;
      }

      if (_totalViews != null) {
        setState(() => _totalViews = startingValue);
      }
    }
  }

  @override
  void dispose() {
    _totalViews = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final songsProvider = FavoritesStateContainer.of(context);
    final songs = songsProvider.songs;
    final index = songs.indexOf(widget.songItem);

    final isFavorite = songs.elementAt(index).isFavorite;

    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
        actions: [
          IconButton(
            icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            tooltip: 'favorite',
            onPressed: () => setState(() => songsProvider.update(index, isFavorite ? false : true)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.white54.withOpacity(0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                      tag: widget.songItem.assetName,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('network_images/${widget.songItem.assetName}'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Song:', style: Theme.of(context).textTheme.subtitle1),
                            SizedBox(height: 8.0),
                            Text(
                              widget.songItem.song,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32.0),
                            Text('Artist:', style: Theme.of(context).textTheme.subtitle1),
                            SizedBox(height: 8.0),
                            Text(widget.songItem.artist),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'network_images/spotify_icon.png',
                      height: 28.0,
                    ),
                    tooltip: 'Spotify',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    icon: Image.asset(
                      'network_images/yt_icon.png',
                      height: 28.0,
                    ),
                    tooltip: 'YouTube',
                    onPressed: () {},
                  ),
                  SizedBox(width: 3.0),
                ],
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Statistics',
                  style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 18.0),
              Container(
                color: Colors.white54.withOpacity(0.08),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.live_tv, size: 35.0),
                      SizedBox(height: 12.0),
                      Column(
                        children: [
                          Text(
                            Utils.numberFormatter(_totalViews),
                            style: TextStyle(fontSize: 28.0),
                          ),
                          SizedBox(height: 12.0),
                          Text('YouTube Views'),
                          SizedBox(height: 2.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              RaisedButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                      colors: <Color>[
                        ColorsUtils.orange,
                        ColorsUtils.pink,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const StadiumBorder(),
                    child: Text(
                      'BROWSE SIMILAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
