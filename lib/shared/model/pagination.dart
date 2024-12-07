import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  const Pagination({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;

  @override
  List<Object> get props {
    return <Object>[
      page,
      limit,
    ];
  }
}
