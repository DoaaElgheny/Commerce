class SearchJobsList {
  List<Items>? items;
  int? totalCount;

  SearchJobsList({this.items, this.totalCount});

  SearchJobsList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class Items {
  int? id;
  String? text;
  int? classificationId;
  String? jobTitle;
  String? jobLevel;
  String? jobType;
  String? jobHours;
  String? salaryRange;
  String? title;
  String? yearsExperience;
  String? country;
  int? countryId;
  String? agentName;
  int? agentId;
  String? agentAttachementFileStorageURL;
  bool? isHideCompanyName;
  int? publishDayNumber;
  bool? isSave;
  int? acceptanceState;
  int? state;

  Items(
      {this.id,
      this.text,
      this.classificationId,
      this.jobTitle,
      this.jobLevel,
      this.jobType,
      this.jobHours,
      this.salaryRange,
      this.title,
      this.yearsExperience,
      this.country,
      this.countryId,
      this.agentName,
      this.agentId,
      this.agentAttachementFileStorageURL,
      this.isHideCompanyName,
      this.publishDayNumber,
      this.isSave,
      this.acceptanceState,
      this.state});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    classificationId = json['classificationId'];
    jobTitle = json['jobTitle'];
    jobLevel = json['jobLevel'];
    jobType = json['jobType'];
    jobHours = json['jobHours'];
    salaryRange = json['salaryRange'];
    title = json['title'];
    yearsExperience = json['yearsExperience'];
    country = json['country'];
    countryId = json['countryId'];
    agentName = json['agentName'];
    agentId = json['agentId'];
    agentAttachementFileStorageURL = json['agentAttachementFileStorageURL'];
    isHideCompanyName = json['isHideCompanyName'];
    publishDayNumber = json['publishDayNumber'];
    isSave = json['isSave'];
    acceptanceState = json['acceptanceState'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['classificationId'] = classificationId;
    data['jobTitle'] = jobTitle;
    data['jobLevel'] = jobLevel;
    data['jobType'] = jobType;
    data['jobHours'] = jobHours;
    data['salaryRange'] = salaryRange;
    data['title'] = title;
    data['yearsExperience'] = yearsExperience;
    data['country'] = country;
    data['countryId'] = countryId;
    data['agentName'] = agentName;
    data['agentId'] = agentId;
    data['agentAttachementFileStorageURL'] = agentAttachementFileStorageURL;
    data['isHideCompanyName'] = isHideCompanyName;
    data['publishDayNumber'] = publishDayNumber;
    data['isSave'] = isSave;
    data['acceptanceState'] = acceptanceState;
    data['state'] = state;
    return data;
  }
}
