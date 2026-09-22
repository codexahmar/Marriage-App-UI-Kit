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
      id: "zainab",
      name: "Zainab Tariq",
      age: 23,
      avatar: AppImages.candidate5,
      lastMessage:
          "Assalam o Alaikum! Would love to connect over family values and career goals 🌿",
      time: "Just now",
      unreadCount: 2,
      isOnline: true,
      hasStory: true,
      tag: "✨ Top Match",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "maryam",
      name: "Maryam",
      age: 23,
      avatar: AppImages.hijabiGirl1,
      lastMessage: "Walaikum Assalam! My family is based in Islamabad as well ☕",
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
      avatar: AppImages.userProfile,
      lastMessage:
          "Shared my tech portfolio! Looking forward to hearing your thoughts 💻",
      time: "48m ago",
      unreadCount: 0,
      isOnline: true,
      hasStory: true,
      tag: "⚡ Fast Responder",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "zorawar",
      name: "Zorawar Afridi",
      age: 26,
      avatar: AppImages.boy4,
      lastMessage:
          "Looking forward to our families meeting over weekend high tea ☕",
      time: "2h ago",
      unreadCount: 0,
      isOnline: false,
      hasStory: true,
      tag: "🔥 Sincere Match",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "shahmeer",
      name: "Shahmeer Ali",
      age: 25,
      avatar: AppImages.boy2,
      lastMessage:
          "Alhamdulillah, spoke with my parents and they would love to arrange a formal meeting.",
      time: "3h ago",
      unreadCount: 0,
      isOnline: true,
      hasStory: true,
      tag: "🌿 Sincere Rishta",
      isVerified: true,
      isMatch: true,
    ),
    ChatConversationModel(
      id: "hania",
      name: "Hania Farooq",
      age: 22,
      avatar: AppImages.hijabiGirl2,
      lastMessage:
          "That heritage conservation project in old Islamabad was truly inspiring!",
      time: "Yesterday",
      unreadCount: 0,
      isOnline: false,
      hasStory: false,
      tag: "✨ Verified",
      isVerified: true,
      isMatch: false,
    ),
    ChatConversationModel(
      id: "daniyal",
      name: "Daniyal Hashmi",
      age: 23,
      avatar: AppImages.boy3,
      lastMessage:
          "Shared that Iqbal couplet with you. Hope your week is going great 📖",
      time: "Yesterday",
      unreadCount: 0,
      isOnline: false,
      hasStory: false,
      tag: "📖 Cultured",
      isVerified: true,
      isMatch: false,
    ),
    ChatConversationModel(
      id: "hamza",
      name: "Hamza Rehman",
      age: 24,
      avatar: AppImages.boy1,
      lastMessage: "Voice note (0:24)",
      time: "2d ago",
      unreadCount: 0,
      isOnline: false,
      hasStory: false,
      tag: "💼 Tech Founder",
      isVoiceMessage: true,
      isVerified: true,
      isMatch: false,
    ),
  ];
}
