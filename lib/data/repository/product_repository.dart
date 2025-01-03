import 'package:flutter_market_app/data/model/product.dart';
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

  Future<Product?> fetchDetail(int id) async {
    final response = await client.get('/api/product/$id');
    if (response.statusCode == 200) {
      final content = response.data['content'];
      return Product.fromJson(content);
    }
    return null;
  }

  Future<bool?> like(int id) async {
    final response = await client.post('/api/product/like/$id');
    if (response.statusCode == 200) {
      return response.data['content'];
    }
    return null;
  }

  Future<bool> delete(int id) async {
    final response = await client.delete('/api/product/$id');
    return response.statusCode == 200;
  }

  // 상품등록
  Future<Product?> create({
    required String title,
    required String content,
    required List<int> imageFileIdList,
    required int categoryId,
    required int price,
  }) async {
    final response = await client.post(
      '/api/product',
      data: {
        'title': title,
        'content': content,
        'imageFileIdList': imageFileIdList,
        'categoryId': categoryId,
        'price': price,
      },
    );
    if (response.statusCode == 201) {
      final content = response.data['content'];
      return Product.fromJson(content);
    }

    return null;
  }

  // 상품수정
  Future<bool> update({
    required int id,
    required String title,
    required String content,
    required List<int> imageFileIdList,
    required int categoryId,
    required int price,
  }) async {
    final response = await client.put(
      '/api/product',
      data: {
        'id': id,
        'title': title,
        'content': content,
        'imageFileIdList': imageFileIdList,
        'categoryId': categoryId,
        'price': price,
      },
    );
    return response.statusCode == 200;
  }
}
