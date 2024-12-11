import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final vworldRepository = VworldRepository();
  test("Vworld name Test", () async {
    final result = await vworldRepository.findByName('연남동');
    expect(result.isEmpty, false);
    final result2 = await vworldRepository.findByName('연남동헿');
    expect(result2.isEmpty, true);
  });
  test("Vworld lat lng Test", () async {
    final result = await vworldRepository.findByLatLng(37.5665, 126.978);
    print(result);
    expect(result.isEmpty, false);
    final result2 = await vworldRepository.findByLatLng(0, 0);
    expect(result2.isEmpty, true);
  });
}
