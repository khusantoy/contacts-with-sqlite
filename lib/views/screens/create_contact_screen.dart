import 'package:contacts_with_sqlite/controllers/contacts_controller.dart';
import 'package:flutter/material.dart';

class CreateContactScreen extends StatefulWidget {
  final ContactsController contactsController;

  const CreateContactScreen({super.key, required this.contactsController});

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';

  bool isLoading = false;

  void addContact() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, '/');
      setState(() {
        isLoading = true;
      });
      await widget.contactsController
          .addContact(firstName, lastName, int.tryParse(phoneNumber)!);
      setState(() {
        isLoading = false;
      });
    }
  }

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
              onPressed: () {
                addContact();
              },
              child: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Save"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("First name"),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter a first name";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      firstName = newValue ?? '';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.transparent,
                      ),
                      label: Text("Last name"),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onSaved: (newValue) {
                      lastName = newValue ?? '';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      label: Text("Phone"),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter a phone number";
                      } else if (int.tryParse(value) == null) {
                        return "Phone number is not correct";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      phoneNumber = newValue ?? '';
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
