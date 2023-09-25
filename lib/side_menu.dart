import 'package:flutter/material.dart';
import 'package:tugaspert3/home_page.dart';
import 'package:tugaspert3/tugas_page.dart';


class Sidemenu extends StatelessWidget{
  const Sidemenu({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Hello Slytherin'),),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tugas'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TugasPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}