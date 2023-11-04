import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarelapp/controller/getuser_api/user.dart';
import 'package:scarelapp/core/text_style.dart';
import 'package:scarelapp/model/model.dart';

class DetailsViewScreen extends StatelessWidget {
  final User user;

  const DetailsViewScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title:  Text('Name',style: font,),
                  subtitle: Text(user.name,style: text,),
                ),
                ListTile(
                  title:  Text('Username',style: font,),
                  subtitle: Text(user.username,style: font),
                ),
                ListTile(
                  title:  Text('Email',style: font),
                  subtitle: Text(user.email,style: text,),
                ),
                ListTile(
                  title:  Text('Phone',style: font),
                  subtitle: Text(user.phone,style: text,),
                ),
                InkWell(
                  onTap: () => Provider.of<GetUser>(context,listen: false).launchURL(user.website),
                  child: ListTile(
                    title:  Text('Website',style: font),
                    subtitle: Text(user.website,style: text,),
                  ),
                ),
                ListTile(
                  title:  Text('Company',style: font),
                  subtitle: Text(user.company.name,style: font),
                ),
                ListTile(
                  title:  Text('Address',style: font,),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.address.street,style: text),
                      Text(user.address.suite,style: text),
                      Text(user.address.city,style: text),
                      Text(user.address.zipcode,style: text),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
