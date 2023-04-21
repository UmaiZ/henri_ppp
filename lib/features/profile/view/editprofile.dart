import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/widgets/greytextfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _currencies = [
    "Cricket",
    "BasketBall",
  ];
  String _currentSelectedValue = "";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'EDIT PROFILE',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          greyGlobalTextField(
            hinttext: 'Name',
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Change Email',
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Bio',
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Birthday',
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.925,
            child: DropdownButtonFormField(
              dropdownColor: Theme.of(context).colorScheme.secondary,
              items: _currencies.map((String category) {
                return new DropdownMenuItem(
                    value: category,
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.bodySmall,
                    ));
              }).toList(),
              onChanged: (newValue) {
                // do other stuff with _category
                //  setState(() => _category = newValue);
              },
              // value: _category,
              decoration: InputDecoration(
                hintText: 'Select Sports',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
