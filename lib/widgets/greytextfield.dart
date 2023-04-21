import 'package:flutter/material.dart';

class greyGlobalTextField extends StatelessWidget {
  final width;
  final hinttext;
  final controller;
  const greyGlobalTextField(
      {super.key, this.width, this.hinttext, this.controller});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * width,
      child: TextField(
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .merge(const TextStyle(color: Colors.grey)),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
