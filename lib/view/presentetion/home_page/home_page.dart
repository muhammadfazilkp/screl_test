import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarelapp/controller/getuser_api/user.dart';
import 'package:scarelapp/core/text_style.dart';
import 'package:scarelapp/view/presentetion/deatail_viewpage/detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<GetUser>(
          builder: (context, getUser, child) {
            if (getUser.users.isEmpty) {
              return  const Center(child: CircularProgressIndicator());
            } else if (getUser.users.isEmpty) {
              return const  Center(child: Text('Failed to fetch data'));
            } else {
              return ListView.builder(
                itemCount: getUser.users.length,
                itemBuilder: (context, index) {
                  final data = getUser.users[index];
                  return InkWell
                  ( 

                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsViewScreen(user: data))),
                    child: Card(
                      child: ListTile(
                        
                        title: Text(data.name ,style: font,),
                        subtitle: Text(data.email,style: font,),
                        
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

