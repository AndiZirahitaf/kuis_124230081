import 'package:flutter/material.dart';
import 'package:kuis/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;

  // Login Function
  void login() {
    // Cek kalau inputnya sudah terisi atau masih kosong.
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // Cek kalau username dan password sudah benar.
      if (_usernameController.text == "umar" &&
          _passwordController.text == "081") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Berhasil"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(_usernameController.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Username / Password salah"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Silahkan isi Username dan Password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.food_bank, color: Colors.orange[600], size: 100),
              SizedBox(height: 10),
              Text(
                "Food App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 40),
              Text(
                "Silahkan Login untuk melanjutkan",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),

              // Username Input
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Password Input
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: _obscure,
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text("Password"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 36),
                  backgroundColor: Colors.orange[600],
                  foregroundColor: Colors.white,
                ),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
