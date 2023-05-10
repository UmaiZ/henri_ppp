import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/widgets/greytextfield.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _currencies = [
    "Cricket",
    "BasketBall",
  ];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  TextEditingController teamcontroller = TextEditingController();
  TextEditingController coachcontroller = TextEditingController();
  TextEditingController schoolcontroller = TextEditingController();
  TextEditingController sportscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context);
    namecontroller.text = usercontroller.userdata.userName.toString();
    biocontroller.text = usercontroller.userdata.userBio.toString();
    teamcontroller.text = usercontroller.userdata.userTeam.toString();
    coachcontroller.text = usercontroller.userdata.userCoaches.toString();
    schoolcontroller.text = usercontroller.userdata.userSchool.toString();
    citycontroller.text = usercontroller.userdata.userCity.toString();
    countrycontroller.text = usercontroller.userdata.userCountry.toString();

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
          GestureDetector(
            onTap: () async {
              if (await usercontroller.UpdateUser({
                "userName": namecontroller.text,
                "userBio": biocontroller.text,
                "userTeam": teamcontroller.text,
                "userCoaches": coachcontroller.text,
                "userSchool": schoolcontroller.text,
                "userSports": sportscontroller.text,
                "userCountry": countrycontroller.text,
                "userCity": citycontroller.text,
              })) {
                Navigator.pop(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
            controller: namecontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Bio',
            controller: biocontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Team',
            controller: teamcontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Coaches',
            controller: coachcontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'School',
            controller: schoolcontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'City',
            controller: citycontroller,
            width: 0.925,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          greyGlobalTextField(
            hinttext: 'Country',
            controller: countrycontroller,
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
                return DropdownMenuItem(
                    value: category,
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.bodySmall,
                    ));
              }).toList(),
              onChanged: (newValue) {
                sportscontroller.text = newValue.toString();
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
