import 'package:elanera/screens/plistscreen/itemScreen.dart';
import 'package:flutter/material.dart';
import '../../services/api_service.dart'; // Ensure this returns UserModel

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  String passwordStrength = '';

  void checkPasswordStrength(String password) {
    if (password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      setState(() {
        passwordStrength = 'Strong';
      });
    } else {
      setState(() {
        passwordStrength = 'Weak';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please enter your data to continue",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Username", style: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Esther Howard",
                suffixIcon: const Icon(Icons.check, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Password", style: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              onChanged: checkPasswordStrength,
              decoration: InputDecoration(
                hintText: "Enter your password",
                suffixIcon: passwordStrength == 'Strong'
                    ? const Text("  Strong", style: TextStyle(color: Colors.green))
                    : passwordStrength == 'Weak'
                        ? const Text("  Weak", style: TextStyle(color: Colors.red))
                        : null,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?",
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Remember me"),
                const Spacer(),
                Switch(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                text: "By connecting your account you confirm that you agree\nwith our ",
                children: [
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () async {
                final username = usernameController.text.trim();
                final password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in both fields')),
                  );
                  return;
                }

                final user = await ApiService.login(username, password);

                if (user != null) {
                final product = await ApiService.fetchProduct();

                if (product != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Prod(productList: product),
                  ),
                );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to fetch product data')),
                  );
                  }
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                },
                child: const Text("Login",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
