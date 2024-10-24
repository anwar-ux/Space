import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';

class MissedVoiceCall extends StatelessWidget {
  final bool isMe;
  MissedVoiceCall({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isMe ? AppColor.chatSend : AppColor.chatRecive,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(color: AppColor.seconderyColor, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Icon(
                      Icons.call,
                      color: AppColor.white,
                    ),
                  ),
                ),
                Constants.kWidth10,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Missed voice call',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'Tap to call back',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
