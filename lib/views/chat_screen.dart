import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/chat_model.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          elevation: 5,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C3E50),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppColor.seconderyColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50, // Set your preferred height
                  child: Image.asset(
                    'assets/5823020.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: AppColor.white),
              onPressed: () {
                // Handle the menu button press
              },
            ),
            Constants.kWidth20,
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
  child: ListView.builder(
    itemCount: dummyData.length,
    itemBuilder: (context, index) {
      final message = dummyData[index];

      switch (message.type) {
        case MessageType.fullLink:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Align(
              alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: FullLink(
                isMe: message.isMe,
               
              ),
            ),
          );

        case MessageType.missedCall:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Align(
              alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: MissedVoiceCall(
                isMe: message.isMe,
               
              ),
            ),
          );

        case MessageType.text:
        default:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Align(
              alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: message.isMe ? AppColor.chatSend : AppColor.chatRecive,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  message.content,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          );
      }
    },
  ),
),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  icon: Icons.add,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 50, // Fixed height for the TextField
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: 'message',
                          filled: true,
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
                ),
                CustomButton(
                  icon: Icons.send,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  CustomButton({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: color,
        size: 22,
      ),
    );
  }
}

class MissedVoiceCall extends StatelessWidget {
  final bool isMe;
  MissedVoiceCall({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isMe ? AppColor.chatSend : AppColor.chatRecive,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: AppColor.seconderyColor, borderRadius: BorderRadius.circular(5)),
            ),
            Constants.kWidth10,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Missed voice call',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Tap to call back')
              ],
            )
          ],
        ));
  }
}

class FullLink extends StatelessWidget {
  final bool isMe;
  FullLink({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7, // 70% of the screen width
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isMe ? AppColor.chatSend : AppColor.chatRecive,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColor.seconderyColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isMe ? AppColor.chatSend : AppColor.chatRecive,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Corperation X - Webflow Ecommerce',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('website template'),
                  Text('corperationtemplate.webflow.io')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

