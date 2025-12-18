import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey  = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter Clone'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _signInKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter an Email',
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter an email';
                } // Regular expression for basic email validation
                return null;
              },
            ), // email
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter a Password',
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter a password';
                }
                if(value.length < 6){
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              obscureText: true, // hide input
            ), // password
            ElevatedButton(
              onPressed: () {
                if(_signInKey.currentState!.validate()){
                  debugPrint('Email: ${_emailController.text}');
                  debugPrint('Password: ${_passwordController.text}');
                } else {
                  debugPrint('Form is invalid');
                }

              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  } // build
} // _MyHomePageState