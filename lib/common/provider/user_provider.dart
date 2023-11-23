import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlogin/common/Model/Dummy_model.dart';
import 'package:riverpodlogin/common/Request/get_request.dart';

import '../Model/login_model.dart';

// final userRequestProvider = Provider<UserRequest>((ref) => UserRequest());

// final dataListProvider = FutureProvider<List<Datum>?>((ref) async {
//   final userRequest = ref.watch(userRequestProvider);
//   final info = await userRequest.userData();
//   return info?.data;
// });
// providers.dart

final userRequestProvider = Provider<UserRequest>((ref) => UserRequest());
final dataListProvider = FutureProvider<Info?>((ref) async {
  final userRequest = ref.watch(userRequestProvider);
  final info = await userRequest.userData();
  return info;
});

final emailControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
final passwordControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final loginProvider = FutureProvider<Login?>((ref) async {
  final userRequest = ref.watch(userRequestProvider);
  final emailController = ref.read(emailControllerProvider);
  final passwordController = ref.read(passwordControllerProvider);

  final loginResult = await userRequest.login(
    email: emailController.text,
    password: passwordController.text,
  );

  return loginResult;
});
