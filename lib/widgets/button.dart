import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class btnGlobal extends StatelessWidget {
  final width;
  final height;
  final text;

  const btnGlobal({super.key, this.width, this.height, this.text});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * width,
        height: size.height * height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0xff916412),
              Color(0xfff1c720),
              Color(0xff916412)
            ],
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        )));
  }
}
