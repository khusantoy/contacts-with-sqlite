import 'package:flutter/material.dart';

class CreateContactScreen extends StatelessWidget {
  const CreateContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text("Create contact"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FilledButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: CircleAvatar(
                radius: 60,
                child: Text(
                  "X",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text("First name"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.transparent,
                  ),
                  label: Text("Last name"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text("Phone"),
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
