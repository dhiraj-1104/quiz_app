import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
      
        style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(10))),
          backgroundColor: orange),
        child: Text(text),
      ),
    );
  }
}
