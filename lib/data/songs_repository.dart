import 'package:music_album_stats/models/song.dart';

class SongsRepository {
  /// local data without fetching
  /// (CodePen doesn't support packages (like http) so use hardcoded values)
  final List<Song> _songs = [
    Song(
      category: Category.top,
      artist: 'PSY',
      song: 'Gangnam Style (강남스타일)',
      assetName: 'PSY-gangnam.jpg',
      views: 3754348924,
    ),
    Song(
      category: Category.top,
      artist: 'Luis Fonsi ft. Daddy Yankee',
      song: 'Despacito',
      assetName: 'fonsi-despacito.jpg',
      views: 6930952171,
    ),
    Song(
      category: Category.top,
      artist: 'Wiz Khalifa ft. Charlie Puth',
      song: 'See You Again',
      assetName: 'khalifa-seeyouagain.jpg',
      views: 4696575458,
    ),
    Song(
      category: Category.top,
      artist: 'Ed Sheeran',
      song: 'Shape of You',
      assetName: 'sheeran-shapeofyou.png',
      views: 4946290413,
    ),
    Song(
      artist: 'Imagine Dragons',
      song: 'Believer',
    ),
    Song(
      artist: 'The Weeknd',
      song: 'Blinding Lights',
    ),
    Song(
      artist: 'Twenty One Pilots',
      song: 'Heathens',
    ),
    Song(
      artist: 'Post Malone ft. 21 Savage',
      song: 'Rockstar',
    ),
    Song(
      artist: 'Lil Nas X ft. Billy Ray Cyrus',
      song: 'Old Town Road',
    ),
  ];

  List<Song> get songs => _songs;
}
