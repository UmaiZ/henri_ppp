import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class txtfieldGlobal extends StatelessWidget {
  final width;
  final hinttext;
  final suffixicon;
  const txtfieldGlobal({super.key, this.width, this.hinttext, this.suffixicon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * width,
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          prefixIcon: suffixicon,
        ),
      ),
    );
  }
}
