import 'package:flutter/material.dart';
import 'package:job_app/presentation/views/auth/login_view.dart';

class FakeView extends StatelessWidget {
  const FakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
            },
            child: const Text('Lets Start')),
      ),
    );
  }
}
