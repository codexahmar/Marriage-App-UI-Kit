import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/features/chats/models/chat_conversation_model.dart';
import 'package:dating_app/features/chats/widgets/activity_story_avatar.dart';
import 'package:dating_app/features/chats/widgets/chat_detail_modal.dart';
import 'package:dating_app/features/chats/widgets/chat_list_item.dart';
import 'package:dating_app/features/chats/widgets/story_viewer_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<ChatConversationModel> _allConversations =
      ChatConversationModel.defaultConversations;
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ChatConversationModel> get _filteredConversations {
    if (_searchQuery.isEmpty) return _allConversations;
    return _allConversations.where((conv) {
      return conv.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          conv.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final conversations = _filteredConversations;
    final newMatches = _allConversations.where((c) => c.isMatch).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Messages",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Clean Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val.trim();
                    });
                  },
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.5,
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search chats',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: AppColors.textMuted,
                      size: 20,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = "";
                              });
                            },
                            child: const Icon(
                              Icons.cancel_rounded,
                              color: AppColors.textMuted,
                              size: 18,
                            ),
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 13.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // New Matches Horizontal Section (Only when not actively searching)
            if (_searchQuery.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "New Matches",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 88,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: newMatches.length,
                  itemBuilder: (context, index) {
                    final match = newMatches[index];
                    return ActivityStoryAvatar(
                      name: match.name.split(' ').first,
                      imagePath: match.avatar,
                      isUnread: match.unreadCount > 0,
                      isOnline: match.isOnline,
                      onTap: () {
                        StoryViewerModal.show(context, match);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  height: 1,
                  color: AppColors.divider,
                ),
              ),
              const SizedBox(height: 8),
            ],

            // Conversations Section Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                _searchQuery.isEmpty ? "Conversations" : "Results",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            // Direct Messages List
            Expanded(
              child: conversations.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 44,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "No chats found",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(top: 4, bottom: 12),
                      itemCount: conversations.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: AppColors.divider,
                        height: 1,
                        indent: 84,
                        endIndent: 20,
                      ),
                      itemBuilder: (context, index) {
                        final conv = conversations[index];
                        return ChatListItem(
                          conversation: conv,
                          onTap: () {
                            ChatDetailModal.show(context, conv);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
