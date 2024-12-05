import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
 final int time;
 final bool isVerifying;
 final String errorMessage;

 const VerificationState({
  required this.time,
  this.isVerifying = false,
  this.errorMessage = '',
 });

 VerificationState copyWith({
  int? time,
  bool? isVerifying,
  String? errorMessage,
 }) {
  return VerificationState(
   time: time ?? this.time,
   isVerifying: isVerifying ?? this.isVerifying,
   errorMessage: errorMessage ?? this.errorMessage,
  );
 }

 @override
 List<Object> get props => [time, isVerifying, errorMessage];
}
