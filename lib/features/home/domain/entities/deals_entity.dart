/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
import 'package:qubeCommerce/features/home/data/models/deal_model.dart';

class Data {
    List<DealModel?>? data;
    int? pageNumber;
    int? totalPages;
    int? totalCount;
    int? pageSize;
    bool? hasPreviousPage;
    bool? hasNextPage;
    int? id;
    String? name;
    DateTime? startDate;
    int? participantsCount;
    String? categoryTitle;
    int? profitPercentage;
    int? minimumOrderValue;
    Picture? picture;

    Data({this.data, this.pageNumber, this.totalPages, this.totalCount, this.pageSize, this.hasPreviousPage, this.hasNextPage, this.id, this.name, this.startDate, this.participantsCount, this.categoryTitle, this.profitPercentage, this.minimumOrderValue, this.picture}); 

    Data.fromJson(Map<String, dynamic> json) {
        if (json['data'] != null) {
         data = <DealModel>[];
         json['data'].forEach((v) {
         data!.add(DealModel.fromJson(v));
        });
      }
        pageNumber = json['pageNumber'];
        totalPages = json['totalPages'];
        totalCount = json['totalCount'];
        pageSize = json['pageSize'];
        hasPreviousPage = json['hasPreviousPage'];
        hasNextPage = json['hasNextPage'];
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
       // data['data'] =data != null ? data!.map((v) => v?.toJson()).toList() : null;
        data['pageNumber'] = pageNumber;
        data['totalPages'] = totalPages;
        data['totalCount'] = totalCount;
        data['pageSize'] = pageSize;
        data['hasPreviousPage'] = hasPreviousPage;
        data['hasNextPage'] = hasNextPage;
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

class DealsEntity {
    bool? succeeded;
    String? message;
    List<String?>? errors;
    Data? data;

    DealsEntity({this.succeeded, this.message, this.errors, this.data}); 

    DealsEntity.fromJson(Map<String, dynamic> json) {
        succeeded = json['succeeded'];
        message = json['message'];
        if (json['errors'] != null) {
        //  errors = <>[];
         json['errors'].forEach((v) {
        //  errors!.add(.fromJson(v));
        });
      }
        data = json['data'] != null ? Data?.fromJson(json['data']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['succeeded'] = succeeded;
        data['message'] = message;
      //  data['errors'] =errors != null ? errors!.map((v) => v?.toJson()).toList() : null;
        // data['data'] = data!.toJson();
        return data;
    }
}

