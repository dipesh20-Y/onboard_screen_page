import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.green[100],
      child: Center(
        child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Image.asset(
              image,
               height: 500,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
            )
          ],
        ),
      ),
      ),
    );
  }
}