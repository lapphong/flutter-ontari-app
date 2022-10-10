
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;

  @JsonKey(name: 'org_width', includeIfNull: false)
  final int? orgWidth;

  @JsonKey(name: 'org_height', includeIfNull: false)
  final int? orgHeight;

  Picture({
     this.url,
     this.orgWidth,
     this.orgHeight,
  });

  // String fullSizeUrl({int maxSize = 2048}) {
  //   return (orgHeight > 2048) ? '$url?h=$maxSize' : url;
  // }
  //

  String get imgUrl => url ?? '';

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
