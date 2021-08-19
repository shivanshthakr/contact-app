import 'dart:io';

import 'package:contacts/providers/contact_provider.dart';
import 'package:contacts/widgets/delete_contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsLittleDetail extends StatefulWidget {
  final String firstname;
  final String lastname;
  final int contactsList;
  final File image;
  final Key key;
  ContactsLittleDetail(
      this.firstname, this.lastname, this.contactsList, this.image,
      {this.key});

  @override
  _ContactsLittleDetailState createState() => _ContactsLittleDetailState();
}

class _ContactsLittleDetailState extends State<ContactsLittleDetail> {
  Future<void> _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(8.0),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Icon(Icons.contacts),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.firstname,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.lastname,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeleteContact(
              firstname: widget.firstname,
              lastname: widget.lastname,
            ),
            RaisedButton(
              onPressed: () => setState(() {
                _launched = _makePhoneCall('tel:${widget.contactsList}');
              }),
              child: Icon(Icons.call),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: () {
                //   Navigator.of(context).pushNamed(UpdateContactScreen.routeName,
                //       arguments: Contacts(
                //           firstname: firstname,
                //           lastname: lastname,
                //           contactList: contactsList,
                //           profilePhoto: image));
              },
              icon: Icon(Icons.more),
              color: Theme.of(context).accentColor,
            ),
          ],
        )
        // FlatButton.icon(onPressed: null, icon: Icon(Icons.delete), label: null)
      ],
    );
  }
}
