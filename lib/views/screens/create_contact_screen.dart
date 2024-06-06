import 'package:flutter/material.dart';

class CreateContactScreen extends StatelessWidget {
  const CreateContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          icon: const Icon(Icons.close),
        ),
        title: const Text("Create contact"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
