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
      id: "aiman",
      name: "Aiman",
      age: 22,
      image: AppImages.match1,
      profession: "Psychology Researcher & Writer",
      distance: "2.1 km away",
      location: "Islamabad, PK",
      matchPercentage: 98,
      isVerified: true,
      tag: "⚡ Super Match",
      section: "Today",
      isLiked: true,
      bio:
          "Psychology researcher with a heart for community welfare. Passionate about family harmony, Urdu literature, and Karak chai.",
      interests: ["📖 Urdu Adab", "☕ Karak Chai", "🌿 Community Work", "🕌 Islamic History"],
      promptQuestion: "My ideal Sunday",
      promptAnswer:
          "Family breakfast in Islamabad followed by quiet reading and coffee.",
    ),
    MatchModel(
      id: "anum",
      name: "Anum",
      age: 23,
      image: AppImages.match2,
      profession: "Architect & Spatial Designer",
      distance: "3.4 km away",
      location: "Islamabad, PK",
      matchPercentage: 95,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Today",
      isLiked: false,
      bio:
          "Architect designing sustainable residential spaces. Looking for mutual understanding, respect, and shared growth.",
      interests: ["🏛️ Architecture", "🎨 Sketching", "📚 Islamic Art", "🏸 Badminton"],
      promptQuestion: "Together we could",
      promptAnswer:
          "Build a peaceful home rooted in gratitude, faith, and mutual respect.",
    ),
    MatchModel(
      id: "rameen",
      name: "Rameen",
      age: 24,
      image: AppImages.match3,
      profession: "Senior Product Designer",
      distance: "1.8 km away",
      location: "Islamabad, PK",
      matchPercentage: 96,
      isVerified: true,
      tag: "🔥 Hot Pick",
      section: "Today",
      isLiked: true,
      bio:
          "Visual Designer with a creative soul. Valuing honesty, family values, and uplifting conversations.",
      interests: ["✨ UI Design", "☕ Coffee", "🖼️ Islamic Art", "🎧 Podcasts"],
      promptQuestion: "The best way to win me over",
      promptAnswer:
          "Bring genuine sincerity, kindness to elders, and a great sense of humor.",
    ),
    MatchModel(
      id: "hoorain",
      name: "Hoorain",
      age: 25,
      image: AppImages.match4,
      profession: "Landscape Photographer",
      distance: "4.2 km away",
      location: "Islamabad, PK",
      matchPercentage: 93,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      isLiked: false,
      bio:
          "Photographer capturing northern landscapes of Hunza and Skardu. Grounded in traditions with a passion for traveling.",
      interests: ["📷 Landscape Photo", "🏔️ Northern Areas", "🌿 Nature Walks", "🥖 Baking"],
      promptQuestion: "A life goal of mine",
      promptAnswer:
          "Performing Hajj and Umrah together and exploring northern Pakistan.",
    ),
    MatchModel(
      id: "eshal",
      name: "Eshal",
      age: 26,
      image: AppImages.match5,
      profession: "Educational Consultant",
      distance: "2.8 km away",
      location: "Islamabad, PK",
      matchPercentage: 97,
      isVerified: true,
      tag: "⚡ Top Match",
      section: "Yesterday",
      isLiked: true,
      bio:
          "Educational consultant working with youth development programs. Believer in patience, empathy, and strong moral values.",
      interests: ["🎓 Education", "👗 Modest Fashion", "📖 Books", "✈️ Travel"],
      promptQuestion: "I get along best with people who",
      promptAnswer:
          "Have strong moral grounding, respect their families, and strive for self-growth.",
    ),
    MatchModel(
      id: "khadija",
      name: "Khadija",
      age: 23,
      image: AppImages.match6,
      profession: "Clinical Nutritionist",
      distance: "5.0 km away",
      location: "Islamabad, PK",
      matchPercentage: 94,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      isLiked: false,
      bio:
          "Nutritionist and modest fashion enthusiast. Dedicated to healthy living, family gatherings, and sincere friendships.",
      interests: ["🥗 Nutrition", "🍵 Green Tea", "🛍️ Modest Styling", "✨ Calligraphy"],
      promptQuestion: "My simple pleasures",
      promptAnswer:
          "Warm homemade chai with family and watching rain over Margalla hills.",
    ),
  ];
}
