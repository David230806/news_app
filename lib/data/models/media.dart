import 'package:news_app/data/models/media_meta_data.dart';
import 'package:news_app/domain/entity/media.dart';

class MediaModel extends MediaEntity {
  MediaModel({
    required super.type,
    required super.subtype,
    required super.caption,
    required super.copyright,
    required super.meta,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      type: json['type'],
      subtype: json['subtype'],
      caption: json['caption'],
      copyright: json['copyright'],
      meta: MediaMetaData.fromJson((json['media-metadata'] as List)[2]),
    );
  }
}
