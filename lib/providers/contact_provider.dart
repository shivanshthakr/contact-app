import 'dart:io';

import 'package:contacts/helpers/databse_helper.dart';
import 'package:flutter/cupertino.dart';

class Contacts {
  final String firstname;
  final String lastname;
  final int contactList;
  final File profilePhoto;
  Contacts(
      {this.firstname, this.contactList, this.profilePhoto, this.lastname});
}

class ContactsProvider with ChangeNotifier {
  List<Contacts> _list = [];
  List<Contacts> get lists {
    return [..._list];
  }

  void addContact(
      String firstname, String lastname, int contacts, File photo) {
    DBhelper.insert('contacts', {
      'id': firstname + lastname,
      'number': contacts.toString(),
      'image': null,
      'firstname': firstname,
      'lastname': lastname,
    });
    getandSet();
    notifyListeners();
  }

  Future<void> getandSet() async {
    final datalist = await DBhelper.getData('contacts');
    _list = datalist
        .map((contact) => Contacts(
              firstname: contact['firstname'],
              lastname: contact['lastname'],
              contactList: int.parse(contact['number']),
              profilePhoto: null,
            ))
        .toList();
    notifyListeners();
  }

  void deleteContact(String firstname, String lastname) {
    DBhelper.delete('contacts', firstname+lastname);
    getandSet();
    notifyListeners();
  }
  // void updateContact(String firstname,String lastname,String ){
  //   DBhelper.update('contacts', {
  //     'id':firstname+lastname
  //   });
  // }

  
}
