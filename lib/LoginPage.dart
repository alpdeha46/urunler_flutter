import 'package:epo_app/HomePage.dart';
import 'package:flutter/material.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white,
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
        ElevatedButton(
          onPressed: ()  {
         if(_usernameController.text == "admin" &&  _passwordController.text == "1234" ) 
         {
           Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          
         }
         else {
           showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Login Failed'),
                content: const Text('Şifre veya Kullanıcı adı yanlış!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
        
         }
                 
        
        
           
          },
                        child: const Text('Login'),
        ),
              
            
           ] ),
        ),
            ),
      ),
    );
  }
}