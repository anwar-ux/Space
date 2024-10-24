import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';

class MessageTextFiled extends StatelessWidget {
  const MessageTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 50, // Fixed height for the TextField
          child: TextField(
            
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'message',
              filled: true,
              suffixIcon: Icon(Icons.mic,color: Colors.grey,),
              fillColor: const Color(0xFFEBEBEB),
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}