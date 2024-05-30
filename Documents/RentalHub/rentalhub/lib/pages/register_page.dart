import 'package:flutter/material.dart';
import 'dart:math';

import 'package:rentalhub/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String? selectedRole;
  int passwordLength = 8; // Default password length
  bool isPasswordVisible = false;
  bool isCPasswordVisible = false;
  bool isPasswordGenerated = false; // To track if password is generated

  void Register() {
    if (selectedRole == 'Owner') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } else if(selectedRole == 'Tenant')
     {
      Navigator.push(
        context,
         MaterialPageRoute(
          builder: (context) => LoginPage(),
          ));   
     }
 }

  void registerUser() {
    if (formKey.currentState!.validate()) {
      // Registration logic here
      String username = usernameController.text;
      String email = emailController.text;
      String location = locationController.text;
      String password = passwordController.text;
      String confirmPassword = confirmpasswordController.text;
      String role = selectedRole!;

      // Implement your registration logic with the obtained data
    }
  }

  String generatePassword(int length) {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+{}[]';
    Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.lightBlue,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more advanced email validation logic if needed
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: passwordLength.toString(),
                  decoration: InputDecoration(
                    labelText: 'Password Length (8-15)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      passwordLength = int.tryParse(value) ?? 8;
                      if (passwordLength < 8) passwordLength = 8;
                      if (passwordLength > 15) passwordLength = 15;
                    });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      passwordController.text = generatePassword(passwordLength);
                      confirmpasswordController.text = passwordController.text;
                      isPasswordGenerated = true;
                    });
                  },
                  child: Text('Generate Password'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  readOnly: isPasswordGenerated, // Make it read-only if password is generated
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        }),
                  ),
                  obscureText: !isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8 || value.length > 15) {
                      return 'Password must be between 8 and 15 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: confirmpasswordController,
                  readOnly: isPasswordGenerated, // Make it read-only if password is generated
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                        icon: Icon(
                          isCPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isCPasswordVisible = !isCPasswordVisible;
                          });
                        }),
                  ),
                  obscureText: !isCPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedRole,
                    items: ['Tenant', 'Owner']
                        .map((role) => DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Select Role',
                        labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your role';
                      }
                      return null;
                    },
                  ),
                ),
               const SizedBox(height: 15),
              TextButton(style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.deepPurple),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(16)),
                  mouseCursor: MaterialStateMouseCursor.clickable,
  
              ),
                onPressed: Register,
                 child: const Text(
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ) ,
                           "Register")
                           ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
