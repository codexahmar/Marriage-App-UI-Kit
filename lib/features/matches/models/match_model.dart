import 'package:dating_app/core/constants/app_assets.dart';

class MatchModel {
  final String id;
  final String name;
  final int age;
  final String image;
  final String profession;
  final String distance;
  final String location;
  final int matchPercentage;
  final bool isVerified;
  final String tag;
  final String section;
  final String bio;
  final List<String> interests;
  final String promptQuestion;
  final String promptAnswer;
  final bool isLiked;

  const MatchModel({
    required this.id,
    required this.name,
    required this.age,
    required this.image,
    required this.profession,
    required this.distance,
    this.location = "Islamabad, PK",
    required this.matchPercentage,
    this.isVerified = true,
    this.tag = "",
    this.section = "Today",
    required this.bio,
    required this.interests,
    required this.promptQuestion,
    required this.promptAnswer,
    this.isLiked = false,
  });

  MatchModel copyWith({
    String? id,
    String? name,
    int? age,
    String? image,
    String? profession,
    String? distance,
    String? location,
    int? matchPercentage,
    bool? isVerified,
    String? tag,
    String? section,
    String? bio,
    List<String>? interests,
    String? promptQuestion,
    String? promptAnswer,
    bool? isLiked,
  }) {
    return MatchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      image: image ?? this.image,
      profession: profession ?? this.profession,
      distance: distance ?? this.distance,
      location: location ?? this.location,
      matchPercentage: matchPercentage ?? this.matchPercentage,
      isVerified: isVerified ?? this.isVerified,
      tag: tag ?? this.tag,
      section: section ?? this.section,
      bio: bio ?? this.bio,
      interests: interests ?? this.interests,
      promptQuestion: promptQuestion ?? this.promptQuestion,
      promptAnswer: promptAnswer ?? this.promptAnswer,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  static const List<MatchModel> defaultMatches = [
    MatchModel(
      id: "zorawar",
      name: "Zorawar Afridi",
      age: 26,
      image: AppImages.boy4,
      profession: "Corporate Lawyer",
      distance: "3.2 km away",
      location: "Islamabad, PK",
      matchPercentage: 97,
      isVerified: true,
      tag: "⚡ Super Match",
      section: "Today",
      isLiked: true,
      bio:
          "Practicing corporate law in Islamabad. Valuing deen, family integrity, and mutual respect. Enjoy weekend polo riding, chai with family, and trekking through Skardu trails.",
      interests: [
        "⚖️ Corporate Law",
        "🐎 Horse Riding",
        "🏔️ Skardu Treks",
        "☕ Karak Chai"
      ],
      promptQuestion: "My ideal Sunday",
      promptAnswer:
          "Polo riding in the morning, family lunch, and evening Karak chai in Islamabad.",
    ),
    MatchModel(
      id: "maryam",
      name: "Maryam",
      age: 23,
      image: AppImages.hijabiGirl1,
      profession: "Clinical Psychologist",
      distance: "2.1 km away",
      location: "Islamabad, PK",
      matchPercentage: 98,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Today",
      isLiked: true,
      bio:
          "Clinical psychologist dedicated to child mental wellness. Practicing hijab, fond of Arabic calligraphy, Islamic history, and quiet evenings with loved ones over Kashmiri chai.",
      interests: [
        "📖 Quran & Hadith",
        "🎨 Calligraphy",
        "☕ Kashmiri Chai",
        "🌿 Mental Health"
      ],
      promptQuestion: "Together we could",
      promptAnswer:
          "Build a peaceful, faith-centered home rooted in gratitude, patience, and warmth.",
    ),
    MatchModel(
      id: "hamza",
      name: "Hamza Rehman",
      age: 24,
      image: AppImages.boy1,
      profession: "Senior Product Designer",
      distance: "4.5 km away",
      location: "Islamabad, PK",
      matchPercentage: 95,
      isVerified: true,
      tag: "🔥 Hot Pick",
      section: "Today",
      isLiked: false,
      bio:
          "Senior product designer working in Islamic fintech. Looking for an educated, emotionally mature life partner who values both spiritual growth and worldly ambition.",
      interests: [
        "💻 Fintech & UI",
        "📚 Urdu Adab",
        "🏋️ Calisthenics",
        "🎧 Tech Podcasts"
      ],
      promptQuestion: "The best way to win me over",
      promptAnswer:
          "Genuine sincerity, intellect, kindness to family elders, and great chai conversations.",
    ),
    MatchModel(
      id: "shahmeer",
      name: "Shahmeer Ali",
      age: 25,
      image: AppImages.boy2,
      profession: "Chartered Accountant (ACA)",
      distance: "5.0 km away",
      location: "Islamabad, PK",
      matchPercentage: 94,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Today",
      isLiked: false,
      bio:
          "Chartered accountant (ACA) at an advisory firm. Believer in sincerity, shared laughter, and strong family bonds. Passionate about fitness, good food, and weekend drives.",
      interests: [
        "📈 Finance & Audit",
        "🚗 Scenic Drives",
        "🍳 Desi Cuisines",
        "🏸 Badminton"
      ],
      promptQuestion: "A life goal of mine",
      promptAnswer:
          "Performing Umrah together and building a blessed, peaceful family foundation.",
    ),
    MatchModel(
      id: "ahmaryar",
      name: "Ahmaryar Khan",
      age: 22,
      image: AppImages.userProfile,
      profession: "Mobile Software Engineer",
      distance: "1.8 km away",
      location: "Islamabad, PK",
      matchPercentage: 99,
      isVerified: true,
      tag: "⚡ Top Match",
      section: "Yesterday",
      isLiked: true,
      bio:
          "Passionate mobile software engineer and tech entrepreneur. Grounded in Islamic values, family traditions, and continuous self-improvement. Looking for a genuine soulmate.",
      interests: [
        "📱 Flutter Dev",
        "🤖 AI & Startups",
        "🏋️ Fitness",
        "🎮 Strategy Games"
      ],
      promptQuestion: "I get along best with people who",
      promptAnswer:
          "Are ambitious yet humble, family-centric, and appreciate deep, thoughtful discussions.",
    ),
    MatchModel(
      id: "hania",
      name: "Hania Farooq",
      age: 22,
      image: AppImages.hijabiGirl2,
      profession: "Architect",
      distance: "3.8 km away",
      location: "Islamabad, PK",
      matchPercentage: 96,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      isLiked: false,
      bio:
          "Architect focused on heritage restoration across Pakistan. Looking for someone grounded, respectful, and family-oriented who appreciates art, design, and deep conversations.",
      interests: [
        "🏛️ Heritage Architecture",
        "📸 Aesthetics",
        "☕ Specialty Coffee",
        "🌿 Indoor Plants"
      ],
      promptQuestion: "My simple pleasures",
      promptAnswer:
          "A cup of warm coffee on a rainy Islamabad morning and sketching historic architecture.",
    ),
    MatchModel(
      id: "daniyal",
      name: "Daniyal Hashmi",
      age: 23,
      image: AppImages.boy3,
      profession: "Civil Engineer",
      distance: "6.1 km away",
      location: "Rawalpindi / ISL",
      matchPercentage: 93,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      isLiked: false,
      bio:
          "Civil engineer working on sustainable urban development. Deeply appreciative of classical Urdu poetry (Iqbal & Faiz), traditional ethics, and morning badminton matches.",
      interests: [
        "🏗️ Infrastructure",
        "✍️ Urdu Poetry",
        "🏸 Badminton",
        "🌄 Monal Sunsets"
      ],
      promptQuestion: "Favorite way to spend an evening",
      promptAnswer:
          "Discussing classic Urdu poetry with chai while enjoying sunset views over Margalla hills.",
    ),
    MatchModel(
      id: "zainab",
      name: "Zainab Tariq",
      age: 23,
      image: AppImages.candidate5,
      profession: "Bridal Designer",
      distance: "1.5 km away",
      location: "Islamabad, PK",
      matchPercentage: 97,
      isVerified: true,
      tag: "✨ Verified Rishta",
      section: "Yesterday",
      isLiked: true,
      bio:
          "Haute couture bridal designer blending traditional Pakistani craftsmanship with modern elegance. Seeking a supportive, God-fearing life partner for a blessed future.",
      interests: [
        "👗 Bridal Couture",
        "🎨 Fine Art",
        "✈️ Umrah & Travel",
        "☕ High Tea"
      ],
      promptQuestion: "My ideal vision for marriage",
      promptAnswer:
          "A partnership based on mawaddah (love), rahmah (compassion), and mutual support in our deen and ambitions.",
    ),
  ];
}
