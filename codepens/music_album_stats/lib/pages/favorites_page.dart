import 'package:flutter/material.dart';
import 'package:music_album_stats/data/favorites_provider.dart';
import 'package:music_album_stats/widgets/recommended_list_tile.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final songsProvider = FavoritesStateContainer.of(context);
    final songs = songsProvider.songs;

    final favoriteSongs = songs.where((song) => song.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Container(
        child: Center(
          child: favoriteSongs.isEmpty
              ? Text('Nothing here yet.')
              : ListView.builder(
                  itemCount: favoriteSongs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    final song = favoriteSongs[index];
                    final baseIndex = songs.indexOf(song);

                    return RecommendedListTile(
                      isFavoritePage: true,
                      songItem: song,
                      onPressed: () => setState(() => songsProvider.update(baseIndex, false)),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
