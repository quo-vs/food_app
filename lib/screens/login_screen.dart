import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/models/foderlich_pages.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.loginPath,
      key: ValueKey(FooderlichPages.loginPath),
      child: const LoginScreen()
    );
  }

  final String? username;

  const LoginScreen({Key? key, this.username}) : super(key: key);

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focucedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocucedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/rw_logo.png'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildTextfield(username ?? 'username'),
              const SizedBox(
                height: 16,
              ),
              _buildTextfield('password'),
              const SizedBox(
                height: 16,
              ),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Provider.of<AppStateManager>(context, listen: false)
            .login('mock', 'password');
        },
      ),
    );
  }

  Widget _buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.green,
          width: 1,
        )),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.green,
        )),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
