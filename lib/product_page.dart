// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlogin/common/provider/user_provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dataList = ref.watch(dataListProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, watch, child) {
                return dataList.when(
                  data: (userList) {
                    final productsList = userList?.products;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: productsList?.length,
                        itemBuilder: (context, index) {
                          final product = productsList?[index];
                          return ListTile(
                            title: Text(product?.title ?? ''),
                            leading: CircleAvatar(
                              child:
                                  Image.network(product?.images?.first ?? ""),
                            ),
                            subtitle: Text(product?.price.toString() ?? ""),
                          );
                        },
                      ),
                    );
                  },
                  loading: () => CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
