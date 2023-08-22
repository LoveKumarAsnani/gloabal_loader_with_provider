import 'package:flutter/material.dart';

class LoadingState extends ChangeNotifier {
  bool isLoading = false;

  // bool get loading => isLoading;

  void startLoader() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("loading start");
      isLoading = true;
      notifyListeners();
    });
  }

  void stopLoader() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("loading end");
      isLoading = false;
      notifyListeners();
    });
  }
}
