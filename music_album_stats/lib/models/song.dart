import 'package:flutter/foundation.dart';

enum Category {
  top,
  recommended,
}

class Song {
  Song({
    Category category = Category.recommended,
    bool isFavorite = false,
    @required this.artist,
    @required this.song,
    this.assetName,
    this.views,
  }) {
    _category = category;
    _isFavorite = isFavorite;
  }

  Category _category;
  bool _isFavorite;
  final String artist;
  final String song;
  final String assetName;
  final int views;

  set category(Category newCategory) => _category = newCategory;

  set isFavorite(bool state) => _isFavorite = state;

  Category get category => _category;

  bool get isFavorite => _isFavorite;

  String get assetUrl =>
      'https://raw.githubusercontent.com/mzdm/codepens/master/music_album_stats/network_images/$assetName';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Song &&
          runtimeType == other.runtimeType &&
          _category == other._category &&
          _isFavorite == other._isFavorite &&
          artist == other.artist &&
          song == other.song &&
          assetName == other.assetName &&
          views == other.views;

  @override
  int get hashCode =>
      _category.hashCode ^
      _isFavorite.hashCode ^
      artist.hashCode ^
      song.hashCode ^
      assetName.hashCode ^
      views.hashCode;

  @override
  String toString() =>
      'Song{_category: $_category, _isFavorite: $_isFavorite, artist: $artist, song: $song, assetName: $assetName, views: $views}';
}
