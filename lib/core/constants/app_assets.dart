/// Centralized icon assets management.
class AppIcons {
  AppIcons._();

  static const String back = 'assets/icons/ic_back.png';
  static const String filter = 'assets/icons/ic_filter.png';
  static const String location = 'assets/icons/ic_location.png';
  static const String send = 'assets/icons/ic_send.png';
  static const String like = 'assets/icons/ic_like.png';
  static const String dislike = 'assets/icons/ic_dislike.png';
  static const String star = 'assets/icons/ic_star.png';
}

class AppImages {
  AppImages._();

  // Branding & Illustrations
  static const String logo = 'assets/images/img_logo.png';
  static const String illustrationPeople = 'assets/images/img_people.png';
  static const String illustrationChat = 'assets/images/img_chat.png';
  static const String onboarding1 = 'assets/images/onboarding1.jpeg';
  static const String onboarding2 = 'assets/images/onboarding2.jpeg';
  static const String onboarding3 = 'assets/images/onboarding3.jpeg';
  static const String onboarding = 'assets/images/onboarding.jpeg';

  // User Profile
  static const String userProfile = 'assets/images/img_user_profile.png';

  // Candidates & Explore (Pakistani / Matrimonial Profiles)
  static const String boy1 = 'assets/images/boy1.jpeg';
  static const String boy2 = 'assets/images/boy2.jpeg';
  static const String boy3 = 'assets/images/boy3.jpeg';
  static const String boy4 = 'assets/images/boy4.jpeg';
  static const String hijabiGirl1 = 'assets/images/hijabi_girl1.jpeg';
  static const String hijabiGirl2 = 'assets/images/hijabigirl2.jpeg';

  // Legacy Candidate 5 (Retained for rich profile gallery)
  static const String candidate5 = 'assets/images/img_candidate_5.png';
  static const String candidate1 = 'assets/images/img_candidate_1.png';
  static const String candidate2 = 'assets/images/img_candidate_2.png';
  static const String candidate3 = 'assets/images/img_candidate_3.png';
  static const String candidate4 = 'assets/images/img_candidate_4.png';

  // Candidate Gallery Photos
  static const String gallery1 = 'assets/images/img_gallery_1.png';
  static const String gallery2 = 'assets/images/img_gallery_2.png';
  static const String gallery3 = 'assets/images/img_gallery_3.png';
  static const String gallery4 = 'assets/images/img_gallery_4.png';
  static const String gallery5 = 'assets/images/img_gallery_5.png';

  // Matches
  static const String match1 = 'assets/images/img_match_1.png';
  static const String match2 = 'assets/images/img_match_2.png';
  static const String match3 = 'assets/images/img_match_3.png';
  static const String match4 = 'assets/images/img_match_4.png';
  static const String match5 = 'assets/images/img_match_5.png';
  static const String match6 = 'assets/images/img_match_6.png';
}

/// Unified AppAssets facade maintaining descriptive constants and backward compatibility
class AppAssets {
  AppAssets._();

  // Icons
  static const String icBack = AppIcons.back;
  static const String icFilter = AppIcons.filter;
  static const String icLocation = AppIcons.location;
  static const String icSend = AppIcons.send;
  static const String icLike = AppIcons.like;
  static const String icDislike = AppIcons.dislike;
  static const String icStar = AppIcons.star;

  // Legacy icon aliases
  static const String btnBack = AppIcons.back;
  static const String btnFilter = AppIcons.filter;
  static const String btnLocation = AppIcons.location;
  static const String btnSend = AppIcons.send;
  static const String like = AppIcons.like;
  static const String dislike = AppIcons.dislike;
  static const String star = AppIcons.star;

  // Branding & Illustrations
  static const String logo = AppImages.logo;
  static const String people = AppImages.illustrationPeople;
  static const String chat = AppImages.illustrationChat;
  static const String onboarding1 = AppImages.onboarding1;
  static const String onboarding2 = AppImages.onboarding2;
  static const String onboarding3 = AppImages.onboarding3;
  static const String onboarding = AppImages.onboarding;

  // Profile & Candidates
  static const String cardSwipe1 = AppImages.userProfile;
  static const String userProfile = AppImages.userProfile;
  static const String boy1 = AppImages.boy1;
  static const String boy2 = AppImages.boy2;
  static const String boy3 = AppImages.boy3;
  static const String boy4 = AppImages.boy4;
  static const String hijabiGirl1 = AppImages.hijabiGirl1;
  static const String hijabiGirl2 = AppImages.hijabiGirl2;
  static const String candidate1 = AppImages.candidate1;
  static const String candidate2 = AppImages.candidate2;
  static const String candidate3 = AppImages.candidate3;
  static const String candidate4 = AppImages.candidate4;
  static const String candidate5 = AppImages.candidate5;

  // Legacy candidate aliases
  static const String girl1 = AppImages.candidate2;
  static const String girl2 = AppImages.candidate3;
  static const String girl3 = AppImages.candidate4;
  static const String girl4 = AppImages.candidate1;
  static const String photoMain = AppImages.candidate5;

  // Candidate Gallery Photos
  static const String gallery1 = AppImages.gallery1;
  static const String gallery2 = AppImages.gallery2;
  static const String gallery3 = AppImages.gallery3;
  static const String gallery4 = AppImages.gallery4;
  static const String gallery5 = AppImages.gallery5;

  // Legacy gallery aliases
  static const String photoMain2 = AppImages.gallery1;
  static const String photoMain3 = AppImages.gallery2;
  static const String photoMain4 = AppImages.gallery3;
  static const String photoMain5 = AppImages.gallery4;
  static const String photoMain6 = AppImages.gallery5;

  // Matches
  static const String match1 = AppImages.match1;
  static const String match2 = AppImages.match2;
  static const String match3 = AppImages.match3;
  static const String match4 = AppImages.match4;
  static const String match5 = AppImages.match5;
  static const String match6 = AppImages.match6;

  // Legacy match aliases
  static const String matches1 = AppImages.match1;
  static const String matches2 = AppImages.match2;
  static const String matches3 = AppImages.match3;
  static const String matches4 = AppImages.match4;
  static const String matches5 = AppImages.match5;
  static const String matches6 = AppImages.match6;
}
