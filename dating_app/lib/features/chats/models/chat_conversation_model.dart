import 'package:dating_app/core/constants/app_assets.dart';

class ChatConversationModel {
  final String id;
  final String name;
  final int age;
  final String avatar;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final bool isVerified;
  final bool hasStory;
  final String tag;
  final bool isTyping;
  final bool isVoiceMessage;
  final bool isMatch;

  const ChatConversationModel({
    required this.id,
    required this.name,
    required this.age,
    required this.avatar,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isVerified = true,
    this.hasStory = false,
    this.tag = "",
    this.isTyping = false,
    this.isVoiceMessage = false,
    this.isMatch = true,
  });

  static const List<ChatConversationModel> defaultConversations = [
    ChatConversationModel(
      id: "jessica",
      name: "Jessica Parker",
      age: 23,
      avatar: AppAssets.photoMain,
      lastMessage: "Sawada coffee at 4 PM sounds perfect! ☕ See you there.",
      time: "Just now",
      unreadCount: 2,
      isOnline: true,
      hasStory: true,
      tag: "✨ Top Match",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "alice",
      name: "Alice Vance",
      age: 22,
      avatar: AppAssets.girl4,
      lastMessage: "I just developed the 35mm film from yesterday! 📸",
      time: "14m ago",
      unreadCount: 1,
      isOnline: true,
      hasStory: true,
      tag: "⚡ Active Today",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "ahmaryar",
      name: "Ahmaryar Khan",
      age: 22,
      avatar: AppAssets.cardSwipe1,
      lastMessage: "Sent you the indie playlist link 🎧 Let me know what you think!",
      time: "48m ago",
      unreadCount: 0,
      isOnline: true,
      hasStory: true,
      tag: "⚡ Fast Responder",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "camille",
      name: "Camille Laurent",
      age: 24,
      avatar: AppAssets.girl1,
      lastMessage: "Loved that moody French cinema recommendation 🎬",
      time: "2h ago",
      unreadCount: 0,
      isOnline: false,
      hasStory: true,
      tag: "🔥 Creative Match",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "chloe",
      name: "Chloe Evans",
      age: 23,
      avatar: AppAssets.girl2,
      lastMessage: "That rooftop spot in West Loop had the best house music! 🎶",
      time: "Yesterday",
      unreadCount: 0,
      isOnline: false,
      hasStory: false,
      tag: "✨ Verified",
      isVerified: true,
      isMatch: false,
    ),
    ChatConversationModel(
      id: "roxie",
      name: "Roxie Wilde",
      age: 25,
      avatar: AppAssets.girl3,
      lastMessage: "Voice note (0:24)",
      time: "2d ago",
      unreadCount: 0,
      isOnline: false,
      hasStory: false,
      tag: "🎸 Rockstar Energy",
      isVoiceMessage: true,
      isVerified: true,
      isMatch: false,
    ),
  ];
}
