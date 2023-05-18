import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({Key, key}) : super(key: key);

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
   String _permissionStatus='';
   Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.camera.request();
    setState(() {
      if (status.isGranted) {
        _permissionStatus = 'Permission granted!';
      } else if (status.isDenied) {
        _permissionStatus = 'Permission denied!';
      } else if (status.isPermanentlyDenied) {
        _permissionStatus = 'Permission permanently denied!';
      }
    });
  }


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
             ElevatedButton(onPressed: _requestPermission, child: Text('Get Permission'),),
            ],
          ),
        ),
      ),
    );
  }
}
