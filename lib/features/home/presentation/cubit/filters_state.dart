import '../../domain/entities/filter_option.dart';

class FiltersState {
  List<FilterOption> categoryOptions;
  List<FilterOption> stayOptions;
  List<FilterOption> experiencesOptions;
  List<FilterOption> destinationsOptions;
  List<FilterRatingOption> ratingOptions;

  FiltersState({
    required this.categoryOptions,
    required this.stayOptions,
    required this.experiencesOptions,
    required this.destinationsOptions,
    required this.ratingOptions,
  });
}
