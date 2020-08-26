import 'package:flutter/material.dart';
import 'package:music_album_stats/data/favorites_provider.dart';
import 'package:music_album_stats/models/song.dart';
import 'package:music_album_stats/pages/song_page.dart';
import 'package:music_album_stats/widgets/recommended_list_tile.dart';
import 'package:music_album_stats/widgets/top_card.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songs = FavoritesStateContainer.of(context).songs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Songs',
              style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18.0),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: songs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (songs[index].category == Category.top) {
                    final song = songs[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Hero(
                        tag: song.assetName,
                        child: TopCard(
                          songItem: song,
                          onTap: () => SongPage.create(context, song: song),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Recommended',
              style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18.0),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  if (songs[index].category == Category.recommended) {
                    return RecommendedListTile(songItem: songs[index]);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
