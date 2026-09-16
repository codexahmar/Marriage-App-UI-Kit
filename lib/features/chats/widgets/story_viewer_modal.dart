import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/features/chats/models/chat_conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryViewerModal extends StatefulWidget {
  final ChatConversationModel conversation;

  const StoryViewerModal({
    super.key,
    required this.conversation,
  });

  static void show(BuildContext context, ChatConversationModel conversation) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.95),
      builder: (context) => StoryViewerModal(conversation: conversation),
    );
  }

  @override
  State<StoryViewerModal> createState() => _StoryViewerModalState();
}

class _StoryViewerModalState extends State<StoryViewerModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  final TextEditingController _replyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Story Full Image
            Image.asset(
              widget.conversation.avatar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            // 2. Top Vignette Gradient
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 140,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // 3. Bottom Vignette Gradient
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 180,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // 4. Top Header & Story Progress Bar
            Positioned(
              top: 14,
              left: 14,
              right: 14,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Progress Indicator Bar
                  AnimatedBuilder(
                    animation: _progressController,
                    builder: (context, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: _progressController.value,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 2.5,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  // User Info Header
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(widget.conversation.avatar),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.conversation.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (widget.conversation.isVerified) ...[
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Color(0xFF3B82F6),
                                    size: 14,
                                  ),
                                ],
                              ],
                            ),
                            Text(
                              widget.conversation.isOnline
                                  ? "Active now"
                                  : "2 hours ago",
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white.withValues(alpha: 0.75),
                                fontSize: 11.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 5. Bottom Story Reply Bar
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _replyController,
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 13.5,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    "Reply to ${widget.conversation.name.split(' ').first}...",
                                hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 13,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
