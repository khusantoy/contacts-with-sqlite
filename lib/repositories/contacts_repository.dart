import 'package:contacts_with_sqlite/models/contact.dart';
import 'package:contacts_with_sqlite/services/contacts_local_database.dart';

class ContactsRepository {
  final contactsDatabase = ContactsLocalDatabase();

  Future<List<Contact>> getContacts() async {
    return await contactsDatabase.getContacts();
  }

  Future<void> addContact(
      String firstName, String lastName, int phoneNumber) async {
    await contactsDatabase.addContact(firstName, lastName, phoneNumber);
  }

  Future<void> editContact(int id, Map<String, dynamic> contact) async {
    await contactsDatabase.editContact(id, contact);
  }

  Future<void> deleteContact(int id) async {
    await contactsDatabase.deleteNote(id);
  }
}
