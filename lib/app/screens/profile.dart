import 'package:example_getx_restapi/app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Get.arguments as User;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar!),
            ),
            const SizedBox(height: 10),
            Text(user.firstName! + " " + user.lastName!)
          ],
        ));
  }
}
