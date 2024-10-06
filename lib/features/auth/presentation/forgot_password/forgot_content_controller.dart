import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_content_controller.g.dart';

enum ForgotContent { resetPassword, emailSent }

@riverpod
class ForgotContentController extends _$ForgotContentController {
  @override
  ForgotContent build() => ForgotContent.resetPassword;

  void updateContent() => state = ForgotContent.emailSent;
}
