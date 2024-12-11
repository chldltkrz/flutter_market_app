import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/geolocator_helper.dart';
import 'package:flutter_market_app/ui/pages/address_search/address_search_view_model.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Consumer(builder: (context, ref, child) {
              return TextField(
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    final viewModel = ref.read(addressSearchViewModel.notifier);
                    viewModel.searchByName(value);
                  }
                  print(value);
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: '동명 (읍, 면)을 입력하세요'),
              );
            }),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Consumer(builder: (context, ref, child) {
                  return SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        final position = await GeolocatorHelper.getPosition();
                        if (position != null) {
                          final viewModel =
                              ref.read(addressSearchViewModel.notifier);
                          viewModel.searchByLocation(
                              position.latitude, position.longitude);
                        }
                      },
                      child: Text('현재 위치로 찾기'),
                    ),
                  );
                }),
                Consumer(
                  builder: (context, ref, child) {
                    final addresses = ref.watch(addressSearchViewModel);
                    return Expanded(
                      child: ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final item = addresses[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return JoinPage(item);
                                  }),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.transparent,
                                alignment: Alignment.centerLeft,
                                child: Text(item),
                              ),
                            );
                          }),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
