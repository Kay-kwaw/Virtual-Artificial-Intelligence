import 'package:flutter/material.dart';

const String logoPath = 'assets/images/logo.jpg';

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final String fontFamily;

  const ReusableButton({super.key, required this.text, required this.onPressed,this.color = const Color.fromARGB(255, 0, 0, 0),this.textColor = Colors.white,this.borderRadius = 10,this.fontSize = 15, this.width = 300, this.height = 50, this.fontFamily = 'Figtree'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.normal, fontFamily: fontFamily),)),
    );
  }
}

class ReusebaleText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  
  const ReusebaleText({
    super.key,
    required this.text,
    this.color = Colors.black,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
    this.fontFamily = 'Figtree',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          // fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

PreferredSizeWidget customAppBar({
  required String title,
  required String imagePath,
  // VoidCallback? onTap,
  Color backgroundColor = Colors.white,
  Color titleColor = Colors.black, 
  required String fontFamily,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    leading: GestureDetector(
      // onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          logoPath,
          // height: 10,
          // width: 10,
          // fit: BoxFit.contain,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontFamily: fontFamily,
        // fontWeight: FontWeight.bold,
        color: titleColor,
      ),
    ),
    bottom: bottom,
  );
}