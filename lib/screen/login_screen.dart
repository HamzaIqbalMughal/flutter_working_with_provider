import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // ValueNotifier<bool> _togglePassVisibility = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: authProvider.passwordVisibility,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: InkWell(
                  onTap: (){
                    authProvider.toggleVisibilty();
                  },
                  child: authProvider.passwordVisibility ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: (){
                authProvider.login(_emailController.text.toString(), _passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading ? CircularProgressIndicator(color: Colors.white,) : Text('LogIn'),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
