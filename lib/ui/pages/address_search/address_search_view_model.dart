import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들기
// List<String> 그대로 사용

// 2. viewmodel 만들기

class AddressSearchViewModel extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    // TODO: implement build
    return [];
  }

  final vworldRepository = VworldRepository();

  void searchByName(String query) async {
    final result = await vworldRepository.findByName(query);
    state = result;
  }

  void searchByLocation(double lat, double lng) async {
    final result = await vworldRepository.findByLatLng(lat, lng);
    state = result;
  }
}
// 3. viewmodel 관리자 만들기

final addressSearchViewModel =
    NotifierProvider.autoDispose<AddressSearchViewModel, List<String>>(() {
  return AddressSearchViewModel();
});
