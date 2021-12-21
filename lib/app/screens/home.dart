import 'package:example_getx_restapi/app/controllers/counter_controller.dart';
import 'package:example_getx_restapi/app/models/user.dart';
import 'package:example_getx_restapi/app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Getx"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("USING OBX"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: Obx(() => counterController.dataAvailable
                      ? (showWidget(counterController.users))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const CircularProgressIndicator(),
                          ],
                        )),
                ),
                const SizedBox(height: 10),
                const Text("USING GET BUILDER"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: GetBuilder<CounterController>(
                      init: CounterController(),
                      id: 'users',
                      builder: (_counterController) {
                        if (_counterController.loading!) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const CircularProgressIndicator(),
                            ],
                          );
                        }
                        return showWidget(_counterController.users);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget showWidget(List<User> users) {
  return ListView.builder(
      itemCount: users.length,
      itemBuilder: (__, int index) {
        return InkWell(
          onTap: () {
            Get.to(const Profile(), arguments: users[index]);
          },
          child: ListTile(
            trailing: CircleAvatar(
              radius: 50,
              child: Image.network(users[index].avatar!),
            ),
            title: Text(users[index].firstName!),
            subtitle: Text(
              users[index].lastName!,
            ),
          ),
        );
      });
}
