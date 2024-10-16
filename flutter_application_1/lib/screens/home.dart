import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  Home({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Click me')),
        ),
      ),
    );
  }
}
