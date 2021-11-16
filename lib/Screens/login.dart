import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracepharm/Providers/auth_provider.dart';
import 'package:tracepharm/Screens/homescreen.dart';
import 'package:tracepharm/Utility/widgits.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late AuthProvider authProvider;
  Map<String, String> loginData = {};
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  _logIn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      authProvider.login(loginData, context);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            title: Text("Something went wrong!"),
            content: Text("lease try Again!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Retry!"),
              ),
            ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: authProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text('Email'),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        autofocus: false,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                        onSaved: (value) => loginData['email'] = value!,
                        decoration: buildInputDecoration('Email', Icons.email),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Password"),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        validator: (value) =>
                            value!.isEmpty ? "Please enter password" : null,
                        onSaved: (value) => loginData['password'] = value!,
                        decoration:
                            buildInputDecoration('Enter Password', Icons.lock),
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(onPressed: _logIn, child: Text("LOGIN"))
                      // longButtons('LogIn', () => _logIn)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
