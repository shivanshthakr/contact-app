import 'package:contacts/widgets/new_contact_form.dart';
import 'package:flutter/material.dart';
class AddNewContactScreen extends StatelessWidget {
static const routeName='/add_new_contact';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:NewContactForm(),
      ),
      
    );
  }
}