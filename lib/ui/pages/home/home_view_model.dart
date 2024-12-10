import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 클래스 만들기

// 2. viewmodel만들기

class HomeViewModel extends AutoDisposeNotifier<int> {
  @override
  int build() {
    return 0;
  }

  void onIndexChanged(int newIndex) {
    state = newIndex;
  }
}

// 3. viewmodel 관리자만들기
final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, int>(() {
  return HomeViewModel();
});
