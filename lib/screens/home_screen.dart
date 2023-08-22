import 'package:flutter/material.dart';
import 'package:loading_global/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/safe_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).homeCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Column(
        children: const [
          Text("Content "),
        ],
      ),
    );
  }
}
