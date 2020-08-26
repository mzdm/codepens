import 'package:flutter/foundation.dart';

enum Category {
  top,
  recommended,
}

class Song {
  Song({
    this.category = Category.recommended,
    this.isFavorite = false,
    @required this.artist,
    @required this.song,
    this.assetName,
    this.views,
  });

  Category category;
  bool isFavorite;
  final String artist;
  final String song;
  final String assetName;
  final int views;

  String get assetUrl =>
      'https://raw.githubusercontent.com/mzdm/codepens/master/music_album_stats/network_images/$assetName';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Song &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          isFavorite == other.isFavorite &&
          artist == other.artist &&
          song == other.song &&
          assetName == other.assetName &&
          views == other.views;

  @override
  int get hashCode =>
      category.hashCode ^
      isFavorite.hashCode ^
      artist.hashCode ^
      song.hashCode ^
      assetName.hashCode ^
      views.hashCode;

  @override
  String toString() =>
      'Song{category: $category, isFavorite: $isFavorite, artist: $artist, song: $song, assetName: $assetName, views: $views}';
}
