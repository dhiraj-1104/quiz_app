import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const CustomButton({super.key, required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
      
        style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(10))),
          backgroundColor: color),
        child: Text(text),
      ),
    );
  }
}
