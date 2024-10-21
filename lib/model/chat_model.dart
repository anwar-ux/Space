enum MessageType { text, fullLink, missedCall }

class ChatMessage {
  final MessageType type;
  final String content;
  final bool isMe;
  final String? imageUrl; // Only needed for full link

  ChatMessage({
    required this.type,
    required this.content,
    required this.isMe,
    this.imageUrl,
  });
}

List<ChatMessage> dummyData = [
  ChatMessage(type: MessageType.text, content: "Hey, how are you?", isMe: true),
  ChatMessage(type: MessageType.fullLink, content: "Corperation X - Webflow Ecommerce", isMe: false, imageUrl: 'assets/link_image.png'),
  ChatMessage(type: MessageType.missedCall, content: "Missed voice call", isMe: false),
  ChatMessage(type: MessageType.missedCall, content: "Missed voice call", isMe: true),
  ChatMessage(type: MessageType.text, content: "I'm doing great!", isMe: true),
  ChatMessage(type: MessageType.fullLink, content: "Another link example", isMe: true, imageUrl: 'assets/another_link_image.png'),
];
