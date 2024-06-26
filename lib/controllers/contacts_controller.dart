import 'package:contacts_with_sqlite/models/contact.dart';
import 'package:contacts_with_sqlite/repositories/contacts_repository.dart';

class ContactsController {
  final contactsRepository = ContactsRepository();

  List<Contact> _list = [];

  Future<List<Contact>> get list async {
    _list = await contactsRepository.getContacts();

    return [..._list];
  }

  Future<Contact> getContactById(int id) async {
    return await contactsRepository.getContactById(id);
  }

  Future<void> addContact(
      String firstName, String lastName, int phoneNumber) async {
    await contactsRepository.addContact(firstName, lastName, phoneNumber);
  }

  Future<void> editContact(int id, Map<String, dynamic> contact) async {
    await contactsRepository.editContact(id, contact);
  }

  Future<void> deleteContact(int id) async {
    await contactsRepository.deleteContact(id);
  }
}
