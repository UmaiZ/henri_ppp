import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> showLoader(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      );
    },
  );
}
