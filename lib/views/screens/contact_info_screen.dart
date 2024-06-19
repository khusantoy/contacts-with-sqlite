import 'package:contacts_with_sqlite/controllers/contacts_controller.dart';
import 'package:contacts_with_sqlite/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactInfoScreen extends StatefulWidget {
  final Contact contact;
  const ContactInfoScreen({super.key, required this.contact});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final contactsController = ContactsController();

  void deleteContact(Contact contact) async {
    final response = await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content: Text(
                "Are you want to delete ${contact.firstName} ${contact.lastName}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancel"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Yes, I'do"),
              )
            ],
          );
        });

    if (response) {
      await contactsController.deleteContact(contact.id);
      contactsController.list;
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => deleteContact(widget.contact),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: widget.contact.color,
            radius: 80,
            child: Text(
              widget.contact.firstName[0].toUpperCase(),
              style: const TextStyle(fontSize: 80, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "${widget.contact.firstName} ${widget.contact.lastName}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.contact.color.withOpacity(0.4),
                      radius: 25,
                      child: const Icon(Icons.phone),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Call",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.contact.color.withOpacity(0.4),
                      radius: 25,
                      child: const Icon(Icons.message),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Message",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.contact.color.withOpacity(0.4),
                      radius: 25,
                      child: const Icon(Icons.video_call),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Set up",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: widget.contact.color.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18, bottom: 10),
                    child: Text(
                      "Contact info",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.call),
                    title: Text("+${widget.contact.phoneNumber.toString()}"),
                    subtitle: const Text("Mobile"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
