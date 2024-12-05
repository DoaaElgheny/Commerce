enum Status { loading, success, error }

enum FormValidationError {
  invalidEmail,
  emptyEmail,
  invalidPassword,
  emptyPassword,
  none
}

enum FiType { pdf, image, mp4 }

enum ConnectionStatus { connected, disconnected, connecting }

enum SelectedTabNavigationBar { home, explore, booking, more }

enum ReactTypeName { Like, Love, Support, Funny, Insightful, Celebrate }

const int MaxCount = 10;

class Gender {
  static const int All = 1;
  static const int Male = 2;
  static const int Female = 3;
  static const int MaleAndFemale = 4;
}

class VerificationCode {
  static const int SignUp = 1;
  static const int Forget = 2;
  static const int EditPersonalInfo = 3;
}

class DiscountCondtion {
  static const int Rate = 1;
  static const int Duration = 2;
}

class DurationPackage {
  static const String Day = '1';
  static const String Week = '2';
  static const String Month = '3';
}

class Payment {
  static const int NotPaied = 0;
  static const int Paied = 1;
  static const int Expired = 2;
}

class OpportunityState {
  static const int All = 1;
  static const int Available = 2;
  static const int NotAvailable = 3;
}

class OpportunityAcceptanceState {
  static const int All = 1;
  static const int UnderStudying = 2;
  static const int Accepted = 3;
  static const int Rejected = 4;
  static const int Closed = 5;
}

class ConditionType {
  static const int ShowLogo = 1;
  static const int ShowOpportunity = 2;
  static const int ApplyOpportunity = 3;
  static const int ShowRequests = 4;
  static const int OpportunityNumber = 5;
  static const int CveezDownload = 6;
  static const int NumberOfJobApplications = 7;
}

class VedioStatus {
  static const int All = 1;
  static const int Pending = 2;
  static const int Accepted = 3;
  static const int Rejected = 4;
  static const int Unavailable = 5;
}

class UserTypeContactUs {
  static const int All = 1;
  static const int Agent = 2;
  static const int JobSeeker = 3;
  static const int Visitor = 4;
}

class NotificationType {
  static const int JobAccepted = 1;
  static const int JobRejected = 2;
  static const int JobExpired = 3;
  static const int NewJobApplication = 4;
  static const int ProfileViewed = 5;
  static const int SubscriptionExpire = 6;
  static const int VideoAccepted = 7;
  static const int VideoRejected = 8;
  static const int NewSuitableJob = 9;
  static const int NewJob = 10;
  static const int CVDownloaded = 11;
  static const int ApplicationWatched = 12;
  static const int NewEmployer = 13;
  static const int NewVideo = 14;
  static const int NewJobTitle = 15;
  static const int NewOpportunity = 16;
  static const int NewMessage = 17;
  static const int FromAdmin = 18;
}

class ReactTypeId {
  static const int Like = 1;
  static const int Love = 2;
  static const int Support = 3;
  static const int Funny = 4;
  static const int Insightful = 5;
  static const int Celebrate = 6;
}

enum ReactionType { Like, Love, Support, Funny, Insightful, Celebrate, none }

class AttachementType {
  static const int Video = 1;
  static const int Image = 2;
}

class ReactionSnapType {
  static const int Post = 1;
  static const int Comment = 2;
  static const int Reply = 3;
}

class SnapUserType {
  static const int Agent = 1;
  static const int JobSeeker = 2;
}

class TypePost {
  static const int SnapJob = 1;
  static const int MyPost = 2;
  static const int companyUserPost = 3;
}

class NetworkType {
  static const int All = 1;
  static const int Agent = 2;
  static const int JobSeeker = 3;
}
