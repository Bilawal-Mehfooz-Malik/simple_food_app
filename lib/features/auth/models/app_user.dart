import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    String? uid,
    String? name,
    required String email,
    @Default(false) bool emailVerified,
    required String password,
    String? address,
    String? phoneNumber,
    @Default(false) bool phoneNumberVerified,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
