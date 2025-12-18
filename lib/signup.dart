import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signInKey  = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(height: 20),
            const Text('Sign up to Twitter', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter an Email',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter an email';
                  // Regular expression for basic email validation
                  } else if(!emailValid.hasMatch(value)){
                  return 'Please enter a valid email';
                  } //
                  return null;
                }, // validator
              ), // email
            ), // Container
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter a Password',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ), // contentPadding
                ), // InputDecoration
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter a password';
                  }
                  if(value.length < 6){
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                }, // validator
              ), // TextFormField
            ), // Container
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  if(_signInKey.currentState!.validate()){
                    debugPrint('Email: ${_emailController.text}');
                    debugPrint('Password: ${_passwordController.text}');
                  } else {
                    debugPrint('Form is invalid');
                  }
                }, // onPressed
                child: const Text(
                  'Sign Up', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, // onPressed
              child: Text("Already have an account? Log in",
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // build
} // _SignUpState