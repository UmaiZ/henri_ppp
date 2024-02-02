import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({super.key});

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  bool switchnot = true;
  bool soundnot = true;
  bool vibratenot = true;
  bool updatenot = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'SETTING',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width * 0.925,
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "General Notifications",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: switchnot,
                              onChanged: (value) {
                                setState(
                                  () {
                                    switchnot = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width * 0.925,
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sound",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: soundnot,
                              onChanged: (value) {
                                setState(
                                  () {
                                    soundnot = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width * 0.925,
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vibrate",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: vibratenot,
                              onChanged: (value) {
                                setState(
                                  () {
                                    vibratenot = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width * 0.925,
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Auto Update",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: updatenot,
                              onChanged: (value) {
                                setState(
                                  () {
                                    updatenot = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
