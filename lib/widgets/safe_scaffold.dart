import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_global/viewmodel/loading_view_model.dart';
import 'package:provider/provider.dart';

class SafeScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const SafeScaffold({
    super.key,
    this.appBar,
    this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Consumer<LoadingState>(
              builder: (context, state, child) {
                log("Loading ${state.isLoading}");
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(width: double.infinity, child: body),
                    ),
                    if (state.isLoading)
                      Container(
                        color: Color.fromRGBO(0, 0, 0, .025),
                        child: Center(
                            child: Image.asset(
                          "assets/loader.gif",
                          width: size.width * 0.17,
                          height: size.width * 0.17,
                          fit: BoxFit.contain,
                        )),
                      )
                  ],
                );
              },
            ),
          ),
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
