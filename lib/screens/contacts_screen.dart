import 'package:contacts/providers/contact_provider.dart';
import 'package:contacts/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Provider.of<ContactsProvider>(context,listen: false).getandSet() ,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
         else
          return Consumer<ContactsProvider>(
                builder:(ctx,data,ch)=>
             ListView.builder(
              itemBuilder: (ctx, index) {
                return ContactsLittleDetail(
                  data.lists[index].firstname,
                  data.lists[index].lastname,
                  data.lists[index].contactList,
                  data.lists[index].profilePhoto,
                  key: ValueKey(
                    data.lists[index].firstname,
                  ),
                );
              },
              itemCount: data.lists.length,
            ),
          );
        });
  }
}
