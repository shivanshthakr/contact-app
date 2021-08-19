import 'package:contacts/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  var _firstname = '';
  var _lastname = '';
  var _contacts;
  var _email = '';
  final _key = GlobalKey<FormState>();
  void _saveform() {
    if(!_key.currentState.validate())
          return ;
    _key.currentState.save();
    Provider.of<ContactsProvider>(context, listen: false).addContact(
      _firstname,
      _lastname,
      _contacts,
      null,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Column(
            children: [
              /// for first name and last name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Icon(Icons.portrait),
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value.isEmpty) return 'Enter first name';
                        return null;
                      },
                      onSaved: (value) {
                        _firstname = value;
                      },
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Enter last name';
                        else
                          return null;
                      },
                      onSaved: (value) {
                        _lastname = value;
                      },
                    ),
                  ),
                ],
              ),

              ///for contact list
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.02,
                      child: Icon(Icons.call)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Phone',),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Enter phone number';
                        else
                          return null;
                      },
                      onSaved: (value) {
                        _contacts=int.parse(value);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.02,
                      child: Icon(Icons.email)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Enter email';
                        else
                          return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                  ),
                ],
              ),
              RaisedButton.icon(
                onPressed: _saveform,
                icon: Icon(Icons.save),
                label: Text('Save'),
              ),
            ],
          ),
        
      ),
    );
  }
}
