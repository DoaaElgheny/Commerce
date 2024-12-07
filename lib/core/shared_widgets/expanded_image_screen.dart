import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

import 'package:sizer/sizer.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

class ExpandedImageScreen extends StatefulWidget {
  final List<String?> imageUrls;
  List<String?> videoUrls;
  final int initialIndex;

  ExpandedImageScreen({
    Key? key,
    required this.imageUrls,
    required this.videoUrls,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<ExpandedImageScreen> createState() => _ExpandedImageScreenState();
}

class _ExpandedImageScreenState extends State<ExpandedImageScreen> {
  late PageController _pageController;
  late int selectedIndex;
  final Map<String, Widget> _thumbnailCache = {};

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _cacheThumbnails();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _cacheThumbnails() async {
    for (var url in widget.videoUrls) {
      _thumbnailCache[url!] = await _generateVideoThumbnail(url);
    }
    setState(() {});
  }

  Future<Widget> _generateVideoThumbnail(String videoUrl) async {
    String tempDir = (await getTemporaryDirectory()).path;
    String outputPath = '$tempDir/${DateTime.now().millisecondsSinceEpoch}.png';

    // Generate thumbnail using FFmpeg
    await FFmpegKit.execute(
        '-i $videoUrl -ss 00:00:01.000 -vframes 1 $outputPath');

    final file = File(outputPath);
    if (await file.exists()) {
      return Image.file(
        file,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    return SizedBox.expand(
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        child: const Center(
          child: Icon(
            Icons.video_camera_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 3.h,
                right: 3.w,
                left: 3.w,
                bottom: 1.h,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          if (index >= 0 &&
                              index <
                                  widget.imageUrls.length +
                                      widget.videoUrls.length) {
                            selectedIndex = index;
                          }
                        });
                      },
                      itemCount:
                          widget.imageUrls.length + widget.videoUrls.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        if (index < widget.imageUrls.length) {
                          return _buildImage(index);
                        }
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.imageUrls.length +
                                widget.videoUrls.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (index < widget.imageUrls.length) {
                                return ThumbnailWidget(
                                  mediaUrl: widget.imageUrls[index],
                                  isSelected: selectedIndex == index,
                                  onTap: () {
                                    _pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                );
                              } else {
                                final videoIndex =
                                    index - widget.imageUrls.length;
                                return ThumbnailWidget(
                                  mediaUrl: widget.videoUrls[videoIndex],
                                  thumbnail: _thumbnailCache[
                                      widget.videoUrls[videoIndex]],
                                  isSelected: selectedIndex == index,
                                  onTap: () {
                                    _pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(int index) {
    return Stack(
      children: [
        Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.covered * 2.0,
              imageProvider: CachedNetworkImageProvider(
                widget.imageUrls[index] ??
                    'https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_1280.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Text(
            (index + 1).toString() + 'of' + widget.imageUrls.length.toString(),
            style: TextStyle(),
          ),
        ),
      ],
    );
  }
}

class ThumbnailWidget extends StatelessWidget {
  final String? mediaUrl;
  final Widget? thumbnail;
  final bool isSelected;
  final VoidCallback onTap;

  const ThumbnailWidget({
    Key? key,
    required this.mediaUrl,
    this.thumbnail,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              isSelected ? Border.all(color: Colors.yellow, width: 3) : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _buildMediaWidget(),
        ),
      ),
    );
  }

  Widget _buildMediaWidget() {
    if (mediaUrl != null) {
      if (mediaUrl!.endsWith('.mp4') ||
          mediaUrl!.endsWith('.mov') ||
          mediaUrl!.endsWith('.avi')) {
        return thumbnail ?? _buildPlaceholder();
      } else {
        return Image.network(
          mediaUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        );
      }
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    return SizedBox.expand(
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        child: const Center(
          child: Icon(
            Icons.video_camera_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
