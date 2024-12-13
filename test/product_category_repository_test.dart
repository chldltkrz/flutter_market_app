import 'package:flutter_market_app/data/repository/prudoct_category_repository.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('product category repository test', () async {
    final userRepo = UserRepository();
    final productCategoryRepository = ProductCategoryRepository();

    final result1 = await productCategoryRepository.getCategoryList();
    expect(result1 == null, true);

    await userRepo.login(username: 'tester', password: '1111');
    final result2 = await productCategoryRepository.getCategoryList();
    expect(result2 != null, true);
  });
}
