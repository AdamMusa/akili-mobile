import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SettingController());
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Form(
          key: form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.history_edu_sharp,
                      // Icons.edit_calendar_outlined,
                      size: 180,
                      color: Colors.teal.shade700,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          isDense: true,
                          hintText: 'Entrer votre nom',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          isDense: true,
                          hintText: 'Entrer votre email',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          isDense: true,
                          hintText: 'Entrer le nouveau numero de telephone',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          isDense: true,
                          hintText: 'Entrer le nouveau mot de password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.passwordConfirm,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          isDense: true,
                          hintText: 'Confrimer le nouveau mot de password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          Get.snackbar('signup', 'singup target');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 43),
                          elevation: 0,
                          backgroundColor: Colors.teal.shade700),
                      child: const Text(
                        "Enregister",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 50, 43),
                    elevation: 0,
                    backgroundColor: Colors.teal.shade700),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Se Deconnecter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.logout,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
