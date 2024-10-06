import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_content_controller.g.dart';

@riverpod
class ForgotContentController extends _$ForgotContentController {
  @override
  bool build() => false;

  void updateContent() => state = true;
}
