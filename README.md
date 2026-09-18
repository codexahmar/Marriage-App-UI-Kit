<div align="center">
  <img width="600" height="600" alt="datingapp" src="https://github.com/user-attachments/assets/796ccdd6-6fbb-4a35-a637-4b8f78ffa7ac" />

  # 💕 Flutter Dating App UI (Frontend Only)

  **A modern, premium, and pixel-perfect Dating App UI built with Flutter.**  
  Focuses purely on **UI/UX excellence**, fluid micro-animations, and clean architecture — ready for any backend integration (Firebase, Supabase, Appwrite, REST APIs).

  [![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
  [![UI Only](https://img.shields.io/badge/Architecture-Frontend%20UI%20Only-FF6F61?style=for-the-badge)](https://flutter.dev)
</div>

---

## 🌟 Highlights & Key Features

- 🧼 **Modern & Aesthetic Design**: Inspired by industry-leading dating platforms (Hinge, Tinder, Bumble) with sleek typography, soft ambient shadows, and vibrant accents.
- 🎴 **Interactive Card Deck with Side Peeks**: Smooth swipe interactions with live real-time stamps (`DATE`, `PASS`, `SUPER LIKE`) and a 3D physical deck showing upcoming profile side-peeks.
- 🎯 **Advanced Filter Modal**: Interactive bottom sheet with gender selection, age sliders, distance range, and interest toggles.
- ❤️ **Matches Module**: Organized by "Today" and "Yesterday", featuring instant like/unlike toggles, match modals, and rich candidate bios.
- 💬 **Stories & Real-time Chat UI**: Instagram/WhatsApp-style active story viewer modal, search filters, and chat detail dialog with instant messaging layouts.
- 👤 **Authentic Profile Module**: Clean user profile with photo gallery, discovery settings, push notification toggles, privacy preferences, and confirmation dialogs.
- 🧭 **Unified Navigation Architecture**: Root `IndexedStack` navigation controller preserving card states and scroll positions across tabs with a minimal bottom navigation bar.
- 🗂️ **Organized Asset Structure**: Clean separation of `assets/icons/` and `assets/images/` with standardized naming conventions.
- 🧪 **Fully Tested**: 13/13 comprehensive widget tests covering every user flow and screen transition.

---

## 📱 Module & Screen Breakdown

| Module | Screen / Component | Description |
| :--- | :--- | :--- |
| **Onboarding** | `OnboardingScreen` | 3-step carousel with animated smooth indicators and feature badges. |
| **Auth** | `SignupScreen` | Welcome screen with Google, Facebook, and Apple social login options. |
| **Profile Setup** | `ProfileDetailsScreen` | Name, birthdate, and bio collection. |
| | `GenderScreen` | Gender identity selection with visual feedback. |
| | `PassionsScreen` | Multi-select interest chips (Photography, Travel, Music, etc.). |
| | `SetupActionScreen` | Permission prompts for Notifications and Contact Access. |
| **Explore** | `ExplorePeopleScreen` | Swipeable candidate cards, side-peek stack deck, and Pass/Date/Super Like buttons. |
| | `ExploreFilterModal` | Modal for distance, age range, location, and gender preferences. |
| | `CandidateProfileScreen` | Detailed full profile view with about section, interests, and photo gallery. |
| **Matches** | `MatchesScreen` | Match grid with "All", "Today", and "Yesterday" filter tabs. |
| | `MatchDetailModal` | Bottom sheet with match score, prompt Q&A, and quick chat trigger. |
| **Chats** | `ChatsScreen` | Recent conversations list with search bar and top horizontal story tray. |
| | `StoryViewerModal` | Fullscreen story viewer with progress bar timer and instant reply. |
| | `ChatDetailModal` | Interactive conversation screen with message history and input bar. |
| **Profile** | `ProfileViewScreen` | User profile header, verified badge, gallery, discovery toggles, and logout dialog. |

---

## 📁 Project Directory Structure

```
Flutter-Dating-App-Ui/
├── android/                      # Android native configuration
├── ios/                          # iOS native configuration
├── assets/                       # Centralized asset directory
│   ├── icons/                    # UI icons (ic_back, ic_like, ic_filter, etc.)
│   └── images/                   # Photos, illustrations & logo (img_*.png)
├── lib/
│   ├── main.dart                 # Application entrypoint & Provider setup
│   ├── controllers/              # State controllers (BottomNavBarController)
│   ├── core/                     # Reusable core foundation
│   │   ├── constants/            # AppColors, AppAssets, AppIcons, AppImages
│   │   ├── routes/               # Declarative named routing (AppRoutes)
│   │   ├── theme/                # Global light theme & typography
│   │   └── widgets/              # Reusable UI widgets (buttons, snackbars, navbar)
│   └── features/                 # Modular feature architecture
│       ├── auth/                 # Sign up & login screens and widgets
│       ├── onboarding/           # Onboarding carousel screens and models
│       ├── profile_setup/        # Multi-step profile setup screens
│       ├── main/                 # MainNavigationScreen (IndexedStack host)
│       ├── explore/              # Card swiper, side peeks, filter modal, profile
│       ├── matches/              # Matches grid, filter tabs, match modals
│       ├── chats/                # Conversation list, stories tray, chat dialog
│       └── profile/              # User profile screen, settings & preferences
├── test/
│   └── widget_test.dart          # 13 comprehensive widget test suites
├── pubspec.yaml                  # Dependencies and asset declarations
└── analysis_options.yaml         # Linting and static analysis rules
```

---

## 🎨 Design System & Palette

| Token | Hex / Value | Usage |
| :--- | :--- | :--- |
| **Primary** | `#E94057` | Primary brand accent, active tabs, action buttons |
| **Primary Light** | `#FFF0F2` | Subtle pill backgrounds, active container fills |
| **Secondary** | `#F27121` | Warm gradient accents |
| **Romantic Gradient** | `#E94057` ➔ `#8A2387` | Match badges, super likes, hero accents |
| **Background** | `#FFFFFF` | Primary screen surface |
| **Card Background** | `#F4F4F6` | Elevated cards, search fields, chip containers |
| **Text Primary** | `#1B1B1E` | Headings, candidate names, primary typography |
| **Text Secondary** | `#6B7280` | Subtitles, distances, locations |
| **Border / Divider** | `#E5E7EB` / `#F0F2F5` | Hairline dividers, card borders |

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev) (Dart 3.4+)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Typography**: [Google Fonts](https://pub.dev/packages/google_fonts) (`Plus Jakarta Sans`)
- **Card Swiping**: [flutter_card_swiper](https://pub.dev/packages/flutter_card_swiper)
- **Page Indicators**: [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
- **Phone Input**: [intl_phone_number_input](https://pub.dev/packages/intl_phone_number_input) & [pin_code_fields](https://pub.dev/packages/pin_code_fields)
- **Image Picker**: [image_picker](https://pub.dev/packages/image_picker)

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (`>=3.4.3 <4.0.0`)
- Android Studio / Xcode / VS Code
- A connected physical device or iOS/Android emulator

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/codexahmar/Dating-App-UI-Kit
   cd Dating-App-UI-Kit
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run static analysis & tests:**
   ```bash
   dart analyze
   flutter test
   ```

4. **Launch the application:**
   ```bash
   flutter run
   ```

---

## 💡 Backend Integration Guide

> [!NOTE]
> This project is currently **Frontend UI only**. All screens, models, controllers, and routing are built with clear separation of concerns, making backend integration straightforward.

You can plug in any backend service:
- **Firebase**: Replace static models in `features/*/models/` with Cloud Firestore streams, Firebase Auth for `SignupScreen`, and Firebase Cloud Messaging for push notifications.
- **Supabase**: Connect PostgreSQL tables with realtime row-level security for chat and swipe actions.
- **Custom REST / GraphQL API**: Use `http` or `dio` packages with the provided model `fromJson` serialization patterns.

---

## 🤝 Contributing

Contributions, feature suggestions, and pull requests are welcome!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<div align="center">
  <sub>Built with ❤️ using Flutter & Dart</sub>
</div>

