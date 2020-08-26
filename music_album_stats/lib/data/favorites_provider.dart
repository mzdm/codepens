import 'package:flutter/material.dart';
import 'package:music_album_stats/data/songs_repository.dart';
import 'package:music_album_stats/models/song.dart';

class FavoritesStateContainer extends StatefulWidget {
  final Widget child;

  FavoritesStateContainer({this.child});

  static FavoritesStateContainerState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_InheritedFavoritesStateContainer>()).data;

  @override
  FavoritesStateContainerState createState() => FavoritesStateContainerState();
}

class FavoritesStateContainerState extends State<FavoritesStateContainer> {
  List<Song> songs = SongsRepository().songs;

  void update(int index, bool isFavorite) {
    if (songs == null) {
      songs[index].isFavorite = isFavorite;
      setState(() => songs = songs);
    } else {
      setState(() => songs[index].isFavorite = isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) => _InheritedFavoritesStateContainer(
    data: this,
    child: widget.child,
  );
}

class _InheritedFavoritesStateContainer extends InheritedWidget {
  final FavoritesStateContainerState data;

  _InheritedFavoritesStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedFavoritesStateContainer old) =>
      data.songs != old.data.songs;
}
