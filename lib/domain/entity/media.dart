import 'package:news_app/data/models/media_meta_data.dart';

class MediaEntity {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  final MediaMetaData meta;

  MediaEntity({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.meta,
  });
}
