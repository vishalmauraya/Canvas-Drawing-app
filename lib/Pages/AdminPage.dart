import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("ADMIN"),centerTitle : true,) ,
      body: const Column(
        children: [
          Row(
            children: [

        ],)],
      ),
    );
  }
}
