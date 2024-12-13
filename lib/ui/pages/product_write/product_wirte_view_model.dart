// 1. 상태 클래스 만들기
// 사진 리스트, 카테고리 리스트, 선택된 카테고리 리스트

import 'package:flutter_market_app/data/model/file_model.dart';
import 'package:flutter_market_app/data/model/product.dart';
import 'package:flutter_market_app/data/model/product_category.dart';
import 'package:flutter_market_app/data/repository/file_repository.dart';
import 'package:flutter_market_app/data/repository/product_repository.dart';
import 'package:flutter_market_app/data/repository/prudoct_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductWriteState {
  final List<FileModel> imageFileList;
  final List<ProductCategory> categories;
  final ProductCategory? selectedCategory;

  ProductWriteState({
    required this.imageFileList,
    required this.categories,
    required this.selectedCategory,
  });

  ProductWriteState copyWith({
    List<FileModel>? imageFileList,
    List<ProductCategory>? categories,
    ProductCategory? selectedCategory,
  }) {
    return ProductWriteState(
      imageFileList: imageFileList ?? this.imageFileList,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

// 2. 뷰모델 만들기
class ProductWirteViewModel
    extends AutoDisposeFamilyNotifier<ProductWriteState, Product?> {
  @override
  ProductWriteState build(Product? arg) {
    fetchCategories();
    return ProductWriteState(
      imageFileList: arg?.imageFiles ?? [],
      categories: [],
      selectedCategory: arg?.category,
    );
  }

  final categoryREpository = ProductCategoryRepository();
  final fileRepository = FileRepository();
  final productRepository = ProductRepository();

  // 이미지 업로드
  Future<void> uploadImage({
    required String filename,
    required String mimeType,
    required List<int> bytes,
  }) async {
    final result = await fileRepository.upload(
      bytes: bytes,
      filename: filename,
      mimeType: mimeType,
    );
    if (result != null) {
      state = state.copyWith(
        imageFileList: [...state.imageFileList, result],
      );
    }
  }

  // 상품 수정하거나 생성하는 매서드
  Future<bool?> upload({
    required String title,
    required String content,
    required int price,
  }) async {
    if (state.imageFileList.isEmpty) {
      return null;
    }
    if (state.selectedCategory == null) {
      return null;
    }
    if (arg != null) {
      // 수정
      final result = await productRepository.update(
        id: arg!.id,
        title: title,
        content: content,
        imageFileIdList: state.imageFileList.map((e) => e.id).toList(),
        categoryId: state.selectedCategory!.id,
        price: price,
      );
      return result;
    } else {
      // 생성
      final result = await productRepository.create(
        title: title,
        content: content,
        imageFileIdList: state.imageFileList.map((e) => e.id).toList(),
        categoryId: state.selectedCategory!.id,
        price: price,
      );
      return result != null;
    }
  }

  // 카테고리 선택했을때 수행되는 메서드
  void onCategorySelected(String category) {
    final target = state.categories.where((e) => e.category == category);
    if (target.isEmpty) {
      return;
    }
    final selectedCategory = target.first;
    state = state.copyWith(selectedCategory: selectedCategory);
  }

  // 최초의 카테고리 리스트를 서버에서 가저오는 메서드
  Future<void> fetchCategories() async {
    final categories = await categoryREpository.getCategoryList();
    if (categories != null) {
      state = state.copyWith(categories: categories);
    }
  }
}
// 3. 뷰모델 관리자 만들기

final productWriteViewModel = NotifierProvider.autoDispose
    .family<ProductWirteViewModel, Product?, int>(() {
  return ProductWirteViewModel();
});
