import 'package:dating_app/core/widgets/full_screen_image_viewer.dart';
import 'package:flutter/material.dart';

class ProfileGalleryGrid extends StatelessWidget {
  final List<String> images;

  const ProfileGalleryGrid({
    super.key,
    required this.images,
  });

  void _openPhoto(BuildContext context, int index) {
    FullScreenImageViewer.open(
      context,
      heroTag: 'gallery_photo_$index',
      imagePath: images[index],
      title: "Gallery Photo ${index + 1}",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        if (images.length >= 2)
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _openPhoto(context, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'gallery_photo_0',
                      child: Image.asset(
                        images[0],
                        fit: BoxFit.cover,
                        height: 160,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => _openPhoto(context, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'gallery_photo_1',
                      child: Image.asset(
                        images[1],
                        fit: BoxFit.cover,
                        height: 160,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        if (images.length > 2) ...[
          const SizedBox(height: 12),
          Row(
            children: images.sublist(2).asMap().entries.map((entry) {
              final index = entry.key + 2;
              final img = entry.value;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () => _openPhoto(context, index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Hero(
                        tag: 'gallery_photo_$index',
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                          height: 110,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
