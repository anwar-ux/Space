import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/chat/chat_controller.dart';
import 'package:flutter_application_2/model/chat_model.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_application_2/widgets/chat/audio_player.dart';
import 'package:flutter_application_2/widgets/chat/custom_buttons.dart';
import 'package:flutter_application_2/widgets/chat/full_link_widget.dart';
import 'package:flutter_application_2/widgets/chat/media_widget.dart';
import 'package:flutter_application_2/widgets/chat/message_textfiled.dart';
import 'package:flutter_application_2/widgets/chat/missed_call_widget.dart';
import 'package:flutter_application_2/widgets/chat/pdf_widget.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController()); // Instantiate the controller

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
                    return FullLink(isMe: message.isMe, url: message.imageUrl!);

                  case MessageType.missedCall:
                    return MissedVoiceCall(isMe: message.isMe);

                  case MessageType.audio:
                    return ChatAudioPlayer(isMe: message.isMe, audioUrl: message.audioUrl!);
                  case MessageType.media:
                    return MediaWidget(isMe: message.isMe, widgetIndex: 0);
                  case MessageType.pdf:
                    return PdfWidget(
                      isMe: message.isMe,
                      pdfFile: File(message.pdfPath!),
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
                            borderRadius: message.isMe
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                          ),
                          child: Text(
                            message.content,
                            style: const TextStyle(
                              fontSize: 14,
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
          // TextField Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: chatController.toggleBottomSheet, // Use the controller method
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() => Icon(
                          // Make the Icon reactive
                          chatController.isBottomSheetVisible.value ? Icons.close : Icons.add,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                ),
                const SizedBox(width: 8), // Add spacing between the button and the text field
                const Expanded(child: MessageTextFiled()), // Use Expanded to take available space
                CustomButton(
                  icon: Icons.send,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // Bottom Sheet Toggle Section
          Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: chatController.isBottomSheetVisible.value ? 200 : 0, // Change height based on visibility
                curve: Curves.easeInOut,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.seconderyColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: buildButtons(context).length,
                    itemBuilder: (context, index) {
                      return buildButtons(context)[index];
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
