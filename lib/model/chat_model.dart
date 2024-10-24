enum MessageType { text, fullLink, missedCall, audio, media, pdf }

class ChatMessage {
  final MessageType type;
  final String content;
  final bool isMe;
  final String? imageUrl; // Only needed for full link
  final String? audioUrl;
  final String? pdfPath;

  ChatMessage({required this.type, required this.content, required this.isMe, this.audioUrl, this.imageUrl, this.pdfPath});
}

List<ChatMessage> dummyData = [
  ChatMessage(type: MessageType.text, content: "Hey, how are you?", isMe: true),
  ChatMessage(
    type: MessageType.fullLink,
    content: "Corperation X - Webflow Ecommerce",
    isMe: false,
    imageUrl: 'https://www.mcdonalds.com/',
  ),
  ChatMessage(type: MessageType.missedCall, content: "Missed voice call", isMe: false),
  ChatMessage(type: MessageType.text, content: "I'm doing great!", isMe: true),
  ChatMessage(type: MessageType.fullLink, content: "Another link example", isMe: true, imageUrl: 'https://gemini.google.com/'),
  ChatMessage(
      type: MessageType.audio,
      content: "Missed voice call",
      isMe: true,
      audioUrl: 'https://commondatastorage.googleapis.com/codeskulptor-assets/Evillaugh.ogg'),
  ChatMessage(
      type: MessageType.audio,
      content: "Missed voice call",
      isMe: false,
      audioUrl: 'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3'),
  ChatMessage(
      type: MessageType.media,
      content: "Missed voice call",
      isMe: false,
      audioUrl: 'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3'),
  ChatMessage(
      type: MessageType.media,
      content: "Missed voice call",
      isMe: true,
      audioUrl: 'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3'),
  ChatMessage(type: MessageType.pdf, content: "Missed voice call", isMe: true, pdfPath: 'assets/A key pattern.pdf'),
];
