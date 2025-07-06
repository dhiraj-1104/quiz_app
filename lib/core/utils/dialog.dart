//function to Show Exit Alert msg when exiting the app
import 'package:flutter/material.dart';

Future<bool> showExitConfirmationDialog(BuildContext context) async{
  return (await showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text("Exit App"),
    content: const Text("Are you sure you want to exit app?"),
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.of(context).pop(false);
      }, child: const Text("No")),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pop(true);
      }, child: const Text("Yes"))
    ],
  ))) ?? false;
}