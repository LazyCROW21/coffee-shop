import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _buttonStyle = const ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)))),
    backgroundColor: MaterialStatePropertyAll(Colors.pink),
    padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
  );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userNameInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Coffee Shop",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Mono',
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Username',
                    fillColor: Colors.white),
                controller: _userNameInput,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Password',
                    fillColor: Colors.white),
                controller: _passwordInput,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  style: _buttonStyle,
                  child: Text(
                    'Login'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
