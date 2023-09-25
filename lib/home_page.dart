import 'package:flutter/material.dart';
import 'package:tugaspert3/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
  var namauser;
  void _loadUsername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context){
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the great house of Slytherin \n $namauser',
          style: TextStyle(color: Colors.green, fontSize: 20, fontFamily:'Arial'),
        textAlign: TextAlign.center,),
      ),

      drawer: const Sidemenu(),
    );
  }
}