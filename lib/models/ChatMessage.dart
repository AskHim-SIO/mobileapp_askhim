import 'package:flutter/material.dart';

enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSenders;

  ChatMessage({
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.isSenders,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "YO MEC,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSenders: false,
  ),
  ChatMessage(
    text: "Tu vas bien ?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSenders: true,
  ),
  ChatMessage(
    text: "c'est super ce que tu as fais mon pote",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSenders: false,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSenders: true,
  ),
  ChatMessage(
    text: "tu fais des trucs ce soir",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSenders: false,
  ),
  ChatMessage(
    text: "gros gaming sur lol toute la soirée",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSenders: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.not_view,
    isSenders: false,
  ),
];
