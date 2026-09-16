import 'package:dating_app/core/constants/app_assets.dart';

class CandidateModel {
  final String image;
  final String name;
  final int age;
  final String profession;
  final String distance;
  final String bio;
  final String vibe;
  final List<String> interests;
  final int matchPercentage;
  final bool isVerified;

  const CandidateModel({
    required this.image,
    required this.name,
    required this.age,
    required this.profession,
    required this.distance,
    required this.bio,
    required this.vibe,
    required this.interests,
    required this.matchPercentage,
    this.isVerified = true,
  });

  static const List<CandidateModel> defaultCandidates = [
    CandidateModel(
      image: AppAssets.girl4,
      name: "Alice Vance",
      age: 22,
      profession: "Lifestyle Creator",
      distance: "2.4 km away",
      bio:
          "Finding the best hidden coffee roasters in the city. Golden hour enthusiast & indie music lover.",
      vibe: "⚡ Active Today",
      interests: [
        "📸 35mm Film",
        "☕ Specialty Coffee",
        "🌅 Sunsets",
        "🎵 Indie Pop"
      ],
      matchPercentage: 96,
    ),
    CandidateModel(
      image: AppAssets.cardSwipe1,
      name: "Ahmaryar Khan",
      age: 22,
      profession: "Mobile Software Engineer",
      distance: "3.5 km away",
      bio:
          "Building clean Flutter apps by day, playing strategy games & gym workouts by night.",
      vibe: "⚡ Fast Responder",
      interests: ["💻 Mobile Dev", "🎮 Gaming", "🏋️ Fitness", "🎧 Podcasts"],
      matchPercentage: 95,
    ),
    CandidateModel(
      image: AppAssets.girl1,
      name: "Camille Laurent",
      age: 24,
      profession: "Avant-Garde Makeup Artist",
      distance: "4.0 km away",
      bio:
          "Editorial beauty & visual artist. Obsessed with gold glitter, moody cinema, and late-night talks.",
      vibe: "🔥 Creative Match",
      interests: ["✨ Glitter Art", "🎬 Cinema", "🎭 Theatre", "🍷 Wine Nights"],
      matchPercentage: 94,
    ),
    CandidateModel(
      image: AppAssets.photoMain,
      name: "Jessica Parker",
      age: 23,
      profession: "Haute Couture Model",
      distance: "1.2 km away",
      bio:
          "Living between Chicago & NY. Always up for spontaneous road trips, art galleries & espresso.",
      vibe: "✨ Top Profile",
      interests: ["👗 Fashion", "🎨 Art History", "☕ Espresso", "✈️ Paris"],
      matchPercentage: 99,
    ),
    CandidateModel(
      image: AppAssets.girl2,
      name: "Chloe Evans",
      age: 23,
      profession: "Fashion Consultant & Stylist",
      distance: "4.8 km away",
      bio:
          "Styling editorials & consulting. Minimalist aesthetics, French house music, and rooftop dinners.",
      vibe: "✨ Verified",
      interests: ["👠 Styling", "🍸 Rooftops", "🎶 House Music", "✈️ Milan"],
      matchPercentage: 93,
    ),
    CandidateModel(
      image: AppAssets.girl3,
      name: "Roxie Wilde",
      age: 25,
      profession: "Indie Rock Lead & Musician",
      distance: "5.5 km away",
      bio:
          "Frontwoman for an indie band. Vinyl collector, emerald dresses, and midnight studio sessions.",
      vibe: "🎸 Rockstar Energy",
      interests: [
        "🎸 Electric Guitar",
        "⚡ Rock Music",
        "🖋️ Tattoos",
        "🎙️ Live Gigs"
      ],
      matchPercentage: 96,
    ),
  ];
}
