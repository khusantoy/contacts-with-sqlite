import 'package:contacts_with_sqlite/controllers/contacts_controller.dart';
import 'package:contacts_with_sqlite/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final contactsController = ContactsController();
  TextEditingController searchController = TextEditingController();
  late Future<List<Contact>> contactsFuture;
  FocusNode searchFocusNode = FocusNode();
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    contactsFuture = contactsController.list;
    _refreshContacts();
  }

  Future<void> _refreshContacts() async {
    final contactsList = await contactsController.list;
    setState(() {
      contacts = contactsList;
      filteredContacts = contactsList;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _filterContacts(String query) {
    final filtered = contacts.where((contact) {
      final fullName = '${contact.firstName} ${contact.lastName}'.toLowerCase();
      return fullName.contains(query.toLowerCase());
    }).toList();
    setState(() {
      filteredContacts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: searchController,
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search contacts",
              hintStyle: const TextStyle(height: 1.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onChanged: _filterContacts,
          ),
        ),
      ),
      body: FutureBuilder<List<Contact>>(
          future: contactsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No information"),
              );
            }

            return filteredContacts.isEmpty
                ? const Center(
                    child: Text("No contacts"),
                  )
                : ListView.builder(
                    itemCount: filteredContacts.length,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                      return ListTile(
                        onTap: () async {
                          searchFocusNode.unfocus(); // Unfocus the TextField
                          final result = await Navigator.pushNamed(
                              context, '/info',
                              arguments: contact);
                          if (result == true) {
                            _refreshContacts();
                          }
                        },
                        leading: CircleAvatar(
                          backgroundColor: contact.color,
                          child: Text(
                            contact.firstName[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text("${contact.firstName} ${contact.lastName}"),
                      );
                    },
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          searchFocusNode.unfocus(); // Unfocus the TextField
          final result = await Navigator.pushNamed(context, '/create',
              arguments: contactsController);
          if (result == true) {
            _refreshContacts();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
