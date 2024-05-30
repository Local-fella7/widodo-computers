import 'package:flutter/material.dart';
import 'package:rentalhub/components/my_textfield.dart';
import 'package:rentalhub/pages/register_page.dart';
import 'package:rentalhub/pages/home_page.dart';
import 'package:rentalhub/users/owner/owner_page.dart';
import 'package:rentalhub/users/tenant/tenant_page.dart'; // Import the HomePage

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;

  void Login() {
    if (_selectedRole == 'Owner') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OwnerHomePage(),
          ));
    } else if(_selectedRole == 'Tenant')
     {
      Navigator.push(
        context,
         MaterialPageRoute(
          builder: (context) => const TenantHomePage(),
          ));   
     }
 }

  void signInUser() {
    // Implement your sign-in logic here
    // ignore: unused_local_variable
    String email = _emailController.text;
    // ignore: unused_local_variable
    String password = _passwordController.text;
    String role = _selectedRole!;

    // Example: Check role and navigate to the appropriate page
    if (role == 'Tenant') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (role == 'Owner') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OwnerHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              const SizedBox(height: 30),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Welcome Back to the Rental Hub",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: _emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 40),
              MyTextField(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.deepPurple),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedRole,
                  items: ['Tenant', 'Owner']
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: 'Select Role',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.deepPurple),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(16)),
                  mouseCursor: MaterialStateMouseCursor.clickable,
  
              ),
                onPressed: Login,
                 child: const Text(
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ) ,
                           "Sign-In")
                           ),
              
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member?',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
