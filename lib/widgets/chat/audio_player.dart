import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/chat/audio_player_controller.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class ChatAudioPlayer extends StatelessWidget {
  final bool isMe;
  final String audioUrl;

  const ChatAudioPlayer({super.key, required this.isMe, required this.audioUrl});

  @override
  Widget build(BuildContext context) {
    // Create a unique instance of AudioPlayerController for each audio widget
    final audioController = Get.put(AudioPlayerController(audioUrl: audioUrl), tag: audioUrl);

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7, // 70% width for audio container
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: isMe ? Colors.blueAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (audioController.isPlaying.value) {
                          audioController.pauseAudio();
                        } else {
                          audioController.playAudio();
                        }
                      },
                      child: Icon(
                        audioController.isPlaying.value ? Icons.pause_circle : Icons.play_circle,
                        color: isMe ? AppColor.white : AppColor.chatSend,
                        size: 30,
                      ),
                    ),
                    Constants.kWidth5,
                    Expanded(
                      child: AudioFileWaveforms(
                        size: Size(MediaQuery.of(context).size.width * 0.5, 25),
                        playerController: audioController.playerController,
                        waveformType: WaveformType.fitWidth,
                        enableSeekGesture: true,
                        playerWaveStyle: PlayerWaveStyle(
                          fixedWaveColor: isMe ? AppColor.white : AppColor.chatSend,
                          liveWaveColor: Colors.green, // Played portion (dynamically updated)
                         
                          seekLineColor: Colors.redAccent,
                          seekLineThickness: 1,
                          spacing: 5,
                          waveThickness: 2,
                        ),
                      ),
                    ),
                    Constants.kWidth10,
                    Text(
                      "${audioController.position.value.inMinutes}:${(audioController.position.value.inSeconds % 60).toString().padLeft(2, '0')}",
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
