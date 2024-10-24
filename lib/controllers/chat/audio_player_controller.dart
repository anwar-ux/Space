import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:audioplayers_platform_interface/src/api/player_state.dart' as audioplayers_utils;

class AudioPlayerController extends GetxController {
  late AudioPlayer audioPlayer;
  late PlayerController playerController;

  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;

  final String audioUrl;

  // Add audioUrl as a required argument in the constructor
  AudioPlayerController({required this.audioUrl});

  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
    playerController = PlayerController();

    // Extract waveform data when the controller is initialized
    _initializeWaveform();

    // Listen to player state and update the UI accordingly
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == audioplayers_utils.PlayerState.playing;
    });

    // Listen to duration and position changes
    audioPlayer.onDurationChanged.listen((newDuration) {
      duration.value = newDuration;
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      position.value = newPosition;
      playerController.seekTo(newPosition.inMilliseconds);
    });
  }

  // Method to extract waveform during initialization
  Future<void> _initializeWaveform() async {
    try {
      await playerController.extractWaveformData(path: audioUrl);
      update(); // Call update to refresh the UI once the waveform is extracted
    } catch (e) {
      print("Error extracting waveform: $e");
    }
  }

  Future<void> playAudio() async {
    try {
      await audioPlayer.play(UrlSource(audioUrl));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    playerController.dispose();
    super.onClose();
  }
}
