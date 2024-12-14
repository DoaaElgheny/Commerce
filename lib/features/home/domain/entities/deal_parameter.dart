import '../../../../core/utils/enums.dart';

class DealParameter {
  int? PageNumber;
  int PageSize;

  DealParameter({
    this.PageNumber = 0,
    this.PageSize = MaxCount,
  });

  DealParameter copyWith({
    int? PageNumber,
    int? PageSize,
  }) {
    return DealParameter(
      PageNumber: PageNumber ?? this.PageNumber,
      PageSize: PageSize ?? this.PageSize,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageNumber'] = this.PageNumber;
    data['PageSize'] = this.PageSize;
    return data;
  }
}
