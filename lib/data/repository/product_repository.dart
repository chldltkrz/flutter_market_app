import 'package:flutter_market_app/data/model/product_summary.dart';
import 'package:flutter_market_app/data/repository/base_remote_repository.dart';

class ProductRepository extends BaseRemoteRepository {
  Future<List<ProductSummary>?> getProductSummaryList(
    int addressId,
  ) async {
    final response = await client.get(
      '/api/product',
      queryParameters: {
        'addressId': addressId,
        'size': 100,
      },
    );
    if (response.statusCode == 200) {
      final content = response.data['content']['content'];
      final result = List.from(content).map((e) {
        return ProductSummary.fromJson(e);
      }).toList();
      return result;
    }
    return null;
  }
}
