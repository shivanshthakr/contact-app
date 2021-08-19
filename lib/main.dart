import 'package:contacts/providers/contact_provider.dart';
import 'package:contacts/screens/add_contact_screen.dart';
import 'package:contacts/screens/contacts_screen.dart';
import 'package:contacts/screens/update_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(List<String> args) async {
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ContactsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.indigo[300], accentColor: Colors.pink[100]),
        home: HomePage(),
        routes: {
          AddNewContactScreen.routeName:(ctx)=>AddNewContactScreen(),
          UpdateContactScreen.routeName:(ctx)=>UpdateContactScreen(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          FlatButton.icon(
            onPressed: (){
              Navigator.of(context).pushNamed(AddNewContactScreen.routeName);
            },
            icon: Icon(Icons.person_add),
            label: Text('New Contact'),
          ),
        ],
      ),
      body: ContactScreen(),
      
    );
  }
}
