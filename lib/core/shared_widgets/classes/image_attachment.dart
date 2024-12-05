import 'dart:typed_data';

class ImageAttachment {
  int? type;
  String? attachmentName;
  String? storageName;
  String? attachmentUrl;
  String? filePath;
  bool isSelected;
  Uint8List? thumbImg;

  ImageAttachment(
      {this.type,
      this.attachmentName,
      this.storageName,
      this.attachmentUrl,
      this.filePath,
      this.isSelected = false,
      this.thumbImg});

  factory ImageAttachment.fromJson(Map<String, dynamic> json) {
    return ImageAttachment(
        type: json['type'],
        attachmentName: json['attachementName'],
        attachmentUrl: json['attachementFileStorageURL'],
        storageName: json['attachementFileStorageName']);
  }

  Map<String, dynamic> toJson() {
    return {
      "attachementName": attachmentName,
      "attachementFileStorageName": storageName,
      "type": type
    };
  }
}
