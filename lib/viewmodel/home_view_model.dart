import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loading_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  final LoadingState? _loadingProvider;

  HomeViewModel(this._loadingProvider);

  Future<void> homeCall() async {
    try {
      _loadingProvider!.startLoader();
      Future.delayed(const Duration(seconds: 3)).then((value) {
        _loadingProvider!.stopLoader();
      });
    } catch (e) {
      print('Error: $e');
      _loadingProvider!.stopLoader();
    }
  }
}
