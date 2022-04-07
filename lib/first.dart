import 'package:flutter/material.dart';
import 'package:flutter_engineering_dictionary/second.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Second(4),
    );
  }
}