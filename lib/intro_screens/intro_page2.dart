import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key, key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Image.asset(
                "image/page2.jpg",
                height: 500,
              ),
              SizedBox(height: 10),
              Text(
                'We need Access',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'To identify dog breeds, we need access to the camera and gallery of your device.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
    );
  }
}
