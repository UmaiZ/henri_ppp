import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class greyGlobalTextField extends StatelessWidget {
  final width;
  final hinttext;
  const greyGlobalTextField({super.key, this.width, this.hinttext});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * width,
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .merge(TextStyle(color: Colors.grey)),
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
