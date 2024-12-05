import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:qubeCommerce/core/shared_widgets/classes/image_attachment.dart';
import 'package:qubeCommerce/core/shared_widgets/expanded_image_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ProductImages extends StatefulWidget {
  const ProductImages({required this.itemList, Key? key}) : super(key: key);
  final List<ImageAttachment> itemList;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _currentIndex = 0;
  Map<String, String?> thumbnails = {}; // Change to store file paths

  @override
  void initState() {
    super.initState();
    _generateThumbnails();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 18.0.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 10,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: widget.itemList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return InkWell(
              onTap: () async {
                List<String?> image = [];
                List<String?> video = [];
                for (int i = 0; i < widget.itemList.length; i++) {
                  if (widget.itemList[i].type == 2) {
                    image.add(widget.itemList[i].attachmentUrl);
                  } else {
                    video.add(widget.itemList[i].attachmentUrl);
                  }
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandedImageScreen(
                      imageUrls: image,
                      videoUrls: video,
                      initialIndex: itemIndex,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: widget.itemList[itemIndex].type == 2
                    ? Container(
                  height: 157,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.itemList[itemIndex].attachmentUrl!),
                    ),
                  ),
                )
                    : Container(
                  height: 157,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: thumbnails.containsKey(widget.itemList[itemIndex].attachmentUrl!)
                      ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(
                        File(thumbnails[widget.itemList[itemIndex].attachmentUrl!]!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      const Icon(
                        Icons.play_circle_filled,
                        color: Colors.white,
                        size: 50,
                      ),
                    ],
                  )
                      : _buildPlaceholder(),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.itemList.map((url) {
              int index = widget.itemList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Future<void> _generateThumbnails() async {
    for (int i = 0; i < widget.itemList.length; i++) {
      final attachment = widget.itemList[i];
      if (attachment.type == 1 && attachment.attachmentUrl != null) {
        try {
          final tempDir = await getTemporaryDirectory();
          final videoPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
          final outputPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';
          print('Downloading video: ${attachment.attachmentUrl}');

          // Download the video
          final response = await http.get(Uri.parse(attachment.attachmentUrl!));
          if (response.statusCode == 200) {
            final file = File(videoPath);
            await file.writeAsBytes(response.bodyBytes);
            print('Video downloaded: $videoPath');

            // Execute FFmpeg command to generate the thumbnail
            final session = await FFmpegKit.execute(
                '-i $videoPath -ss 00:00:01.000 -vframes 1 $outputPath'
            );

            final returnCode = await session.getReturnCode();
            if (ReturnCode.isSuccess(returnCode)) {
              // Check if the file was created successfully
              final thumbnailFile = File(outputPath);
              if (await thumbnailFile.exists()) {
                print('Thumbnail generated: $outputPath');
                thumbnails[attachment.attachmentUrl!] = outputPath;
              } else {
                print('Failed to generate thumbnail: File does not exist');
              }
            } else {
              print('FFmpeg command failed with return code $returnCode');
            }
          } else {
            print('Failed to download video: HTTP status ${response.statusCode}');
          }
        } catch (e) {
          print('Error generating thumbnail: $e');
        }
      }
    }
    setState(() {}); // Refresh the widget after thumbnails are generated
  }

  Widget _buildPlaceholder() {
    return SizedBox.expand(
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: const Center(
          child: Icon(
            Icons.video_camera_back_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
