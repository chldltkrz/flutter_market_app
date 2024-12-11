import 'package:dio/dio.dart';

class VworldRepository {
  // 1. 이름으로 검색하는 기능

  final Dio _client = Dio(BaseOptions(
    // 설정안할 시 실패응답오면 throw 발생해서 에러남
    validateStatus: (status) => true,
  ));

  Future<List<String>> findByName(String name) async {
    // response > result > items >> title

    // https://api.vworld.kr/req/search
    // request=search
    // key=06727FAF-5F32-3A19-BAE7-7FBCCE587571
    // query=성미산로126-6
    // type=ROAD
    // category=L4
    try {
      final response = await _client
          .get('https://api.vworld.kr/req/search', queryParameters: {
        'request': 'search',
        'key': '06727FAF-5F32-3A19-BAE7-7FBCCE587571',
        'query': name,
        'type': 'DISTRICT',
        'category': 'L4',
      });
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final items = response.data['response']['result']['items'];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          return '${item['title']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  // 2. 위도 경도로 검색하는 기능
  Future<List<String>> findByLatLng(double lat, double lng) async {
    // response > result > featureCollection > features > properties >> full_nm

    // https://api.vworld.kr/req/data
    // Request=GetFeature
    // Key=06727FAF-5F32-3A19-BAE7-7FBCCE587571
    // Data=LT_C_ADEMD_INFO
    // geomFilter=POINT(129.0826365 35.2210076)
    // geometry=false
    // size=100
    try {
      final response =
          await _client.get('https://api.vworld.kr/req/data', queryParameters: {
        'Request': 'GetFeature',
        'Key': '06727FAF-5F32-3A19-BAE7-7FBCCE587571',
        'Data': 'LT_C_ADEMD_INFO',
        'geomFilter': 'POINT(${lng} ${lat})',
        'geometry': 'false',
        'size': 100,
      });
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final items = response.data['response']['result']['featureCollection']
            ['features'];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          return '${item['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
