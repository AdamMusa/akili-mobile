import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  final controller = Get.put(LoginController());
  LoginView({Key? key}) : super(key: key);
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              children: [
                Image.asset('assets/secure.png'),
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
                      hintText: 'Entrer votre numero de telephone',
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
                      hintText: 'Entrer votre mot de password',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => controller.isLogin.value
                      ? const SizedBox()
                      : SizedBox(
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
                              hintText: 'Confrimer votre mot de password',
                            ),
                          ),
                        ),
                ),
                Obx(
                  () => controller.isLogin.value
                      ? TextButton(
                          onPressed: () => controller.isLogin.value = false,
                          child: const Text(
                            "Creer un compte",
                            style: TextStyle(color: Colors.black87),
                          ),
                        )
                      : TextButton(
                          onPressed: () => controller.isLogin.value = true,
                          child: const Text(
                            "J'ai deja un compte ",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                ),
                Obx(
                  () => controller.isLogin.value
                      ? ElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              Get.snackbar('Login', 'Login target');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(250, 43),
                              elevation: 0,
                              backgroundColor: Colors.teal.shade700),
                          child: const Text(
                            "Se Connecter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              Get.snackbar('signup', 'singup target');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 43),
                            elevation: 0,
                            backgroundColor: Colors.teal.shade700,
                          ),
                          child: const Text(
                            "Creer un compte",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
