import 'package:contacts/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DeleteContact extends StatelessWidget {
  final String firstname;
  final String lastname;
  DeleteContact({this.firstname,this.lastname});
  @override
  
  Widget build(BuildContext context) {
    void _deleteContact(){
      Provider.of<ContactsProvider>(context,listen: false).deleteContact(firstname, lastname);
  }
    return RaisedButton(
      child: Icon(Icons.delete),
      onPressed: _deleteContact,
      color: Theme.of(context).accentColor,

    );
  }
}