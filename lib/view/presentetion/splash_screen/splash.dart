import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarelapp/controller/getuser_api/user.dart';
import 'package:scarelapp/view/presentetion/home_page/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigator(context);
    Provider.of<GetUser>(context,listen: false).fetchUser();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey,
      ),
    );
  }
  navigator(BuildContext context) async{
 Future.delayed( const Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())));
  }
}