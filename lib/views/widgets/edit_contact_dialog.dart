import 'package:contacts_with_sqlite/models/contact.dart';
import 'package:flutter/material.dart';

class EditContactDialog extends StatefulWidget {
  final Contact? contact;
  const EditContactDialog({super.key, required this.contact});

  @override
  State<EditContactDialog> createState() => _EditContactDialogState();
}

class _EditContactDialogState extends State<EditContactDialog> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();

    if (widget.contact != null) {
      firstName = widget.contact!.firstName;
      lastName = widget.contact!.lastName;
      phoneNumber = widget.contact!.phoneNumber.toString();

      firstNameController.text = firstName;
      lastNameController.text = lastName;
      phoneNumberController.text = phoneNumber.toString();
    }
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (newValue) {
                    firstName = newValue ?? '';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
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
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (newValue) {
                    phoneNumber = newValue ?? '';
                  },
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        ),
        FilledButton(
          onPressed: submit,
          child: const Text("Update"),
        ),
      ],
    );
  }
}
