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

  const MatchModel({
    required this.id,
    required this.name,
    required this.age,
    required this.image,
    required this.profession,
    required this.distance,
    this.location = "Chicago, IL",
    required this.matchPercentage,
    this.isVerified = true,
    this.tag = "",
    this.section = "Today",
    required this.bio,
    required this.interests,
    required this.promptQuestion,
    required this.promptAnswer,
  });

  static const List<MatchModel> defaultMatches = [
    MatchModel(
      id: "leilani",
      name: "Leilani",
      age: 19,
      image: AppAssets.matches1,
      profession: "Lifestyle Creator & Model",
      distance: "2.1 km away",
      location: "Chicago, IL",
      matchPercentage: 98,
      isVerified: true,
      tag: "⚡ Super Match",
      section: "Today",
      bio:
          "Film camera collector, golden hour walks along the river, and testing every iced vanilla latte in town.",
      interests: ["📸 35mm Film", "☕ Matcha Lattes", "🌅 Golden Hour", "🎶 Indie Vinyl"],
      promptQuestion: "My ideal Sunday",
      promptAnswer:
          "Farmer's market in Lincoln Park followed by acoustic coffee shop study sessions.",
    ),
    MatchModel(
      id: "annabelle",
      name: "Annabelle",
      age: 20,
      image: AppAssets.matches2,
      profession: "Architecture & Design Student",
      distance: "3.4 km away",
      location: "Chicago, IL",
      matchPercentage: 95,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Today",
      bio:
          "Obsessed with mid-century modern design, museum dates, sketchbook doodles, and rooftop jazz.",
      interests: ["🏛️ Architecture", "🎨 Sketching", "🎷 Live Jazz", "🍷 Wine & Cheese"],
      promptQuestion: "Together we could",
      promptAnswer:
          "Explore hidden architectural gems and spend hours talking about art theory.",
    ),
    MatchModel(
      id: "reagan",
      name: "Reagan",
      age: 24,
      image: AppAssets.matches3,
      profession: "Senior Visual Designer",
      distance: "1.8 km away",
      location: "Chicago, IL",
      matchPercentage: 96,
      isVerified: true,
      tag: "🔥 Hot Pick",
      section: "Today",
      bio:
          "Creating digital typography by day, discovering speakeasies & attending modern gallery openings by night.",
      interests: ["✨ UI Design", "🍸 Speakeasies", "🖼️ Galleries", "🎧 Synthwave"],
      promptQuestion: "The best way to win me over",
      promptAnswer:
          "Take me to an obscure gallery opening with live ambient vinyl sets.",
    ),
    MatchModel(
      id: "hadley",
      name: "Hadley",
      age: 25,
      image: AppAssets.matches4,
      profession: "Editorial & Travel Photographer",
      distance: "4.2 km away",
      location: "Chicago, IL",
      matchPercentage: 93,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      bio:
          "Road trips across coastlines with a camera in hand. Golden retriever mom and sourdough baking amateur.",
      interests: ["📷 Photography", "🏕️ Road Trips", "🐕 Dogs", "🥖 Baking"],
      promptQuestion: "A life goal of mine",
      promptAnswer:
          "Photographing the northern lights in Iceland with someone special.",
    ),
    MatchModel(
      id: "eve",
      name: "Eve",
      age: 27,
      image: AppAssets.matches5,
      profession: "Creative Art Director",
      distance: "2.8 km away",
      location: "Chicago, IL",
      matchPercentage: 97,
      isVerified: true,
      tag: "⚡ Top Match",
      section: "Yesterday",
      bio:
          "Direction for indie fashion magazines. French cinema buff, emerald aesthetics, and vintage furniture hunting.",
      interests: ["🎬 French Cinema", "👗 Fashion Direction", "🛋️ Vintage", "🍷 Red Wine"],
      promptQuestion: "I get along best with people who",
      promptAnswer:
          "Have a passionate creative drive and aren't afraid of spontaneous weekend flights.",
    ),
    MatchModel(
      id: "chloe",
      name: "Chloe",
      age: 21,
      image: AppAssets.matches6,
      profession: "Fashion Merchandiser & Stylist",
      distance: "5.0 km away",
      location: "Chicago, IL",
      matchPercentage: 94,
      isVerified: true,
      tag: "✨ Liked You",
      section: "Yesterday",
      bio:
          "Styling editorial shoots, matcha enthusiast, and finding the best vintage thrift stores in West Town.",
      interests: ["👗 Styling", "🍵 Matcha", "🛍️ Thrifting", "✈️ Paris"],
      promptQuestion: "My simple pleasures",
      promptAnswer:
          "Fresh croissants on rainy mornings and finding rare vintage leather jackets.",
    ),
  ];
}
