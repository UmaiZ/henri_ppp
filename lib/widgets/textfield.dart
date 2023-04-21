import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class txtfieldGlobal extends StatelessWidget {
  final width;
  final hinttext;
  final suffixicon;
  final validator;
  final textController;
  const txtfieldGlobal({
    super.key,
    this.width,
    this.hinttext,
    this.suffixicon,
    this.validator,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * width,
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        controller: textController,
        validator: validator,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          focusedErrorBorder: const OutlineInputBorder(
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
