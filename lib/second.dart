import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final int num;

  // ignore: use_key_in_widget_constructors
  const Second(this.num);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(num.toString()),
    );
  }
}
