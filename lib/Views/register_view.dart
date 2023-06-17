import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_cry/Providers/register_provider.dart';

class RegisterView extends ConsumerWidget {
  static const ROUTE_NAME = "/register";
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerPvd = ref.watch(signUpProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Image.asset(
          "assets/images/firstcry-logo.png",
          width: 90,
        ),
        centerTitle: false,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              TextFormField(
                controller: registerPvd.nameController,
                decoration: const InputDecoration(
                  hintText: "Enter your Full Name",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Mobile Number',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: "+91",
                        hintStyle: TextStyle(color: Colors.black),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: registerPvd.mobileController,
                      decoration: const InputDecoration(
                        hintText: "Enter your Mobile Number",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'OTP will be sent on this Mobile No. for verification.',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email ID',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              TextFormField(
                controller: registerPvd.emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your Email ID",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              TextFormField(
                controller: registerPvd.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your Password",
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Password must be at least 8 characters long with 1 Uppercase, 1 Lowercase & 1 Numeric character',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  registerPvd.register();
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange),
                  child: const Center(
                    child: Text("Continue"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
