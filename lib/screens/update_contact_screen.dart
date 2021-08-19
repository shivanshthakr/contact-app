import 'package:contacts/providers/contact_provider.dart';
import 'package:flutter/material.dart';

class UpdateContactScreen extends StatefulWidget {
  static const routeName='/update-contact';
  Contacts contact;
  UpdateContactScreen({this.contact});
  @override
  _UpdateContactScreenState createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {
  final _formkey = GlobalKey<FormState>();
  var _image = '';
  var _number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child:widget.contact.profilePhoto==null? Container(color: Colors.grey,):Image.network(widget.contact.profilePhoto.toString()),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.photo_camera),
                ),
                Positioned(
                  top: 0,
                  left: 100,
                  child: Text(
                    widget.contact.firstname + widget.contact.lastname,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
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
                          initialValue: widget.contact.contactList.toString(),
                          decoration: InputDecoration(labelText: 'Contact'),
                          validator: (value) {
                            if (value.isEmpty) return 'Invalid';
                            return null;
                          },
                          onSaved: (value) {
                            _number = value;
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
                          decoration: InputDecoration(labelText: 'image'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Invalid image ';
                            else
                              return null;
                          },
                          onSaved: (value) {
                            _image = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.system_update),
                    label: Text('Update'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
