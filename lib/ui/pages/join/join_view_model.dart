import 'dart:typed_data';

import 'package:flutter_market_app/data/model/file_model.dart';
import 'package:flutter_market_app/data/repository/file_repository.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 만들기 FileModel 클래스를 상태 클래스로 사용
// 2. 뷰모델 만들기

class JoinViewModel extends AutoDisposeNotifier<FileModel?> {
  @override
  FileModel? build() {
    return null;
  }

  final fileRepository = FileRepository();
  final userRepository = UserRepository();

  Future<void> uploadImage({
    required String filename,
    required String mimeType,
    required Uint8List bytes,
  }) async {
    final fileModel = await fileRepository.upload(
      bytes: bytes,
      filename: filename,
      mimeType: mimeType,
    );
    state = fileModel;
  }

  Future<bool> join({
    required String username,
    required String password,
    required String nickname,
    required String addressFullName,
  }) async {
    // 파일이 업로드 안되어있으면 리턴 false
    if (state == null) {
      return false;
    }
    final result = await userRepository.join(
      username: username,
      password: password,
      nickname: nickname,
      addressFullName: addressFullName,
      profileImageId: state!.id,
    );
    return result;
  }

  Future<String?> validateName({
    required String username,
    required String nickname,
  }) async {
    final idResult = await userRepository.usernameCk(username);
    if (!idResult) {
      // 아이디 중복
      return "사용할 수 없는 아이디입니다";
    }
    final nickNameResult = await userRepository.nicnnameCk(nickname);
    if (!nickNameResult) {
      return "사용할 수 없는 닉네임입니다";
    }
    return null;
  }
}

// 3. 뷰모델 관리자 만들기
final joinViewModel = NotifierProvider.autoDispose<JoinViewModel, FileModel?>(
  () {
    return JoinViewModel();
  },
);
