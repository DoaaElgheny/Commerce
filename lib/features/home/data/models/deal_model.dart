/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class Picture {
    String? fileName;
    String? contentType;
    String? filePath;
    String? thumbnailPath;
    int? fileSize;
    bool? isMain;

    Picture({this.fileName, this.contentType, this.filePath, this.thumbnailPath, this.fileSize, this.isMain}); 

    Picture.fromJson(Map<String, dynamic> json) {
        fileName = json['fileName'];
        contentType = json['contentType'];
        filePath = json['filePath'];
        thumbnailPath = json['thumbnailPath'];
        fileSize = json['fileSize'];
        isMain = json['isMain'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['fileName'] = fileName;
        data['contentType'] = contentType;
        data['filePath'] = filePath;
        data['thumbnailPath'] = thumbnailPath;
        data['fileSize'] = fileSize;
        data['isMain'] = isMain;
        return data;
    }
}

class DealModel {
    int? id;
    String? name;
    DateTime? startDate;
    int? participantsCount;
    String? categoryTitle;
    int? profitPercentage;
    int? minimumOrderValue;
    Picture? picture;

    DealModel({this.id, this.name, this.startDate, this.participantsCount, this.categoryTitle, this.profitPercentage, this.minimumOrderValue, this.picture}); 

    DealModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        startDate = json['startDate'];
        participantsCount = json['participantsCount'];
        categoryTitle = json['categoryTitle'];
        profitPercentage = json['profitPercentage'];
        minimumOrderValue = json['minimumOrderValue'];
        picture = json['picture'] != null ? Picture?.fromJson(json['picture']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['startDate'] = startDate;
        data['participantsCount'] = participantsCount;
        data['categoryTitle'] = categoryTitle;
        data['profitPercentage'] = profitPercentage;
        data['minimumOrderValue'] = minimumOrderValue;
        data['picture'] = picture!.toJson();
        return data;
    }
}

