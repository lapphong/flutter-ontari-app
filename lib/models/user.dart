import 'package:json_annotation/json_annotation.dart';
import 'package:ontari_app/models/picture.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'avatar')
  final Picture? avatar;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
  });

  String get displayFirstName => firstName ?? '';
  String get displayLastName => lastName ?? '';
  String get displayUserName => username ?? '';
  String get displayEmail => email ?? '';
  // String get displayName => [
  //       firstName?.toLowerCase() ?? '',
  //       lastName?.toLowerCase() ?? ''
  //     ].join(' ').trim();

  String? get imgUrl => avatar?.imgUrl ?? '';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
