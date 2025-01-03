class MediaMetaData {
  final String url;
  final String format;
  final double height;
  final double width;

  MediaMetaData({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetaData.fromJson(Map<String, dynamic> json) {
    return MediaMetaData(
      url: json['url'],
      format: json['format'],
      height: double.parse(json['height'].toString()),
      width: double.parse(json['width'].toString()),
    );
  }
}
