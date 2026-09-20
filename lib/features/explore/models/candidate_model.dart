import 'package:dating_app/core/constants/app_assets.dart';

class CandidateModel {
  final String image;
  final String name;
  final int age;
  final String profession;
  final String distance;
  final String bio;
  final String? shortBio;
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
    this.shortBio,
    required this.vibe,
    required this.interests,
    required this.matchPercentage,
    this.isVerified = true,
  });

  String get displayShortBio => shortBio ?? bio;

  static const List<CandidateModel> defaultCandidates = [
    CandidateModel(
      image: AppImages.boy4,
      name: "Zorawar Afridi",
      age: 26,
      profession: "Corporate Lawyer & Equestrian",
      distance: "3.2 km away • F-7/2, Islamabad",
      shortBio: "Corporate lawyer & polo player who loves northern trails.",
      bio:
          "Practicing corporate law in Islamabad. Valuing deen, family integrity, and mutual respect. Enjoy weekend polo riding, chai with family, and trekking through Skardu trails.",
      vibe: "⚡ Family Verified",
      interests: [
        "⚖️ Corporate Law",
        "🐎 Horse Riding",
        "🏔️ Skardu Treks",
        "☕ Karak Chai"
      ],
      matchPercentage: 97,
    ),
    CandidateModel(
      image: AppImages.hijabiGirl1,
      name: "Maryam",
      age: 23,
      profession: "Clinical Psychologist & Artist",
      distance: "2.1 km away • E-11, Islamabad",
      shortBio: "Psychologist fond of Arabic calligraphy & cozy family chai.",
      bio:
          "Clinical psychologist dedicated to child mental wellness. Practicing hijab, fond of Arabic calligraphy, Islamic history, and quiet evenings with loved ones over Kashmiri chai.",
      vibe: "✨ Practicing & Cultured",
      interests: [
        "📖 Quran & Hadith",
        "🎨 Calligraphy",
        "☕ Kashmiri Chai",
        "🌿 Mental Health"
      ],
      matchPercentage: 98,
    ),
    CandidateModel(
      image: AppImages.boy1,
      name: "Hamza Rehman",
      age: 24,
      profession: "Senior Product Designer & Founder",
      distance: "4.5 km away • Bahria Town, Islamabad",
      shortBio: "Product designer building digital fintech apps for Muslims.",
      bio:
          "Senior product designer working in Islamic fintech & startups. Looking for an educated, emotionally mature life partner who values both spiritual growth and worldly ambition.",
      vibe: "💼 Tech Entrepreneur",
      interests: [
        "💻 Fintech & UI",
        "📚 Urdu Adab",
        "🏋️ Calisthenics",
        "🎧 Tech Podcasts"
      ],
      matchPercentage: 95,
    ),
    CandidateModel(
      image: AppImages.boy2,
      name: "Shahmeer Ali",
      age: 25,
      profession: "Chartered Accountant (ACA)",
      distance: "5.0 km away • DHA Phase 2, Islamabad",
      shortBio: "Chartered accountant who loves scenic Margalla drives & fitness.",
      bio:
          "Chartered accountant (ACA) at an advisory firm. Believer in sincerity, shared laughter, and strong family bonds. Passionate about fitness, good food, and weekend drives.",
      vibe: "🌿 Sincere Intentions",
      interests: [
        "📈 Finance & Audit",
        "🚗 Scenic Drives",
        "🍳 Desi Cuisines",
        "🏸 Badminton"
      ],
      matchPercentage: 94,
    ),
    CandidateModel(
      image: AppImages.userProfile,
      name: "Ahmaryar Khan",
      age: 22,
      profession: "Mobile Software Engineer",
      distance: "1.8 km away • G-11/3, Islamabad",
      shortBio: "Mobile engineer crafting AI & Flutter apps with high ambitions.",
      bio:
          "Passionate mobile software engineer and tech entrepreneur. Grounded in Islamic values, family traditions, and continuous self-improvement. Looking for a genuine soulmate.",
      vibe: "⚡ Fast Responder",
      interests: [
        "📱 Flutter Dev",
        "🤖 AI & Startups",
        "🏋️ Fitness",
        "🎮 Strategy Games"
      ],
      matchPercentage: 99,
    ),
    CandidateModel(
      image: AppImages.hijabiGirl2,
      name: "Hania Farooq",
      age: 22,
      profession: "Architect & Interior Designer",
      distance: "3.8 km away • F-10, Islamabad",
      shortBio: "Architect restoring heritage spaces & enjoying specialty brews.",
      bio:
          "Architect focused on heritage restoration across Pakistan. Looking for someone grounded, respectful, and family-oriented who appreciates art, design, and deep conversations.",
      vibe: "✨ Creative Match",
      interests: [
        "🏛️ Heritage Architecture",
        "📸 Aesthetics",
        "☕ Specialty Coffee",
        "🌿 Indoor Plants"
      ],
      matchPercentage: 96,
    ),
    CandidateModel(
      image: AppImages.boy3,
      name: "Daniyal Hashmi",
      age: 23,
      profession: "Civil Engineer & Poet",
      distance: "6.1 km away • Rawalpindi / ISL",
      shortBio: "Civil engineer with a deep passion for classical Urdu poetry.",
      bio:
          "Civil engineer working on sustainable urban development. Deeply appreciative of classical Urdu poetry (Iqbal & Faiz), traditional ethics, and morning badminton matches.",
      vibe: "📖 Cultured & Traditional",
      interests: [
        "🏗️ Infrastructure",
        "✍️ Urdu Poetry",
        "🏸 Badminton",
        "🌄 Monal Sunsets"
      ],
      matchPercentage: 93,
    ),
    CandidateModel(
      image: AppImages.candidate5,
      name: "Zainab Tariq",
      age: 23,
      profession: "Haute Couture Bridal Designer",
      distance: "1.5 km away • F-6, Islamabad",
      shortBio: "Bridal designer blending traditional craft with modern aesthetics.",
      bio:
          "Haute couture bridal designer blending traditional Pakistani craftsmanship with modern elegance. Seeking a supportive, God-fearing life partner for a blessed future.",
      vibe: "✨ Verified Rishta",
      interests: [
        "👗 Bridal Couture",
        "🎨 Fine Art",
        "✈️ Umrah & Travel",
        "☕ High Tea"
      ],
      matchPercentage: 97,
    ),
  ];
}
