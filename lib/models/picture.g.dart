// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      url: json['url'] as String?,
      orgWidth: json['org_width'] as int?,
      orgHeight: json['org_height'] as int?,
    );

Map<String, dynamic> _$PictureToJson(Picture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('org_width', instance.orgWidth);
  writeNotNull('org_height', instance.orgHeight);
  return val;
}
