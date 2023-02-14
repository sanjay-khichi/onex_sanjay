import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  double? widthSize;
  double? heightSize;


   CommonButton ({Key? key,
     required this.backgroundColor,
     required this.text,
      this.widthSize,
      this.heightSize,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        width: widthSize,
        height: heightSize,


        child: Center(child: Text(text,style: TextStyle(color: Colors.white),),),
        decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
