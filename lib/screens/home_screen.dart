import 'package:flutter/material.dart';
import '../widgets/global/bottom_bar.dart';
import '../widgets/global/top_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
