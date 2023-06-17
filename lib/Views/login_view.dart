import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_cry/Providers/login_provider.dart';
import 'package:my_first_cry/Views/register_view.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginPvd = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
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
              const Text(
                'Login / Register',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email ID/Mobile No.',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              TextFormField(
                controller: loginPvd.emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your Email Id or Mobile No.",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              TextFormField(
                obscureText: true,
                controller: loginPvd.passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter your Password.",
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  loginPvd.login();
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to FirstCry?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing, you agree to FirstCry's ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Conditions of Use ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Notice ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
