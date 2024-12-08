import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/core/utils/assets_manager.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/filters_state.dart';
import '../../domain/entities/filter_option.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit()
      : super(FiltersState(
          categoryOptions: [
            FilterOption('All', false),
            FilterOption('Stays', false),
            FilterOption('Experience', false),
            FilterOption('Tourist trips', false),
          ],
          stayOptions: [
            FilterOption('All', false),
            FilterOption('Camp', false),
            FilterOption('Farm', false),
            FilterOption('Chalet', false),
          ],
          experiencesOptions: [
            FilterOption('Option 1', false),
            FilterOption('Option 2', false),
            FilterOption('Option 3', false),
          ],
          destinationsOptions: [
            FilterOption('Option 1', false),
            FilterOption('Option 2', false),
            FilterOption('Option 3', false),
          ],
          ratingOptions: [
            FilterRatingOption('All', false,false,''),
            FilterRatingOption('40', false,true,ImageAssets.star_ratings5),
            FilterRatingOption('123', false,true,ImageAssets.star_ratings4),
            FilterRatingOption('432', false,true,ImageAssets.star_ratings3),
            FilterRatingOption('342', false,true,ImageAssets.star_ratings2),
            FilterRatingOption('430', false,true,ImageAssets.star_ratings1),

          ],
        ));

  void updateCategoryOption(int index, bool value) {
    state.categoryOptions[index].value = value;
    emit(FiltersState(
      categoryOptions: List.from(state.categoryOptions),
      stayOptions: List.from(state.stayOptions),
      experiencesOptions: List.from(state.experiencesOptions),
      destinationsOptions: List.from(state.destinationsOptions),
      ratingOptions: List.from(state.ratingOptions),
    ));
  }

  void updateStayOption(int index, bool value) {
    state.stayOptions[index].value = value;
    emit(FiltersState(
      categoryOptions: List.from(state.categoryOptions),
      stayOptions: List.from(state.stayOptions),
      experiencesOptions: List.from(state.experiencesOptions),
      destinationsOptions: List.from(state.destinationsOptions),
      ratingOptions: List.from(state.ratingOptions),
    ));
  }

  void updateExperiencesOption(int index, bool value) {
    state.experiencesOptions[index].value = value;
    emit(FiltersState(
      categoryOptions: List.from(state.categoryOptions),
      stayOptions: List.from(state.stayOptions),
      experiencesOptions: List.from(state.experiencesOptions),
      destinationsOptions: List.from(state.destinationsOptions),
      ratingOptions: List.from(state.ratingOptions),
    ));
  }

  void updateDestinationsOption(int index, bool value) {
    state.destinationsOptions[index].value = value;
    emit(FiltersState(
      categoryOptions: List.from(state.categoryOptions),
      stayOptions: List.from(state.stayOptions),
      experiencesOptions: List.from(state.experiencesOptions),
      destinationsOptions: List.from(state.destinationsOptions),
      ratingOptions: List.from(state.ratingOptions),
    ));
  }
  void updateRatingOption(int index, bool value) {
    state.ratingOptions[index].value = value;
    emit(FiltersState(
      categoryOptions: List.from(state.categoryOptions),
      stayOptions: List.from(state.stayOptions),
      experiencesOptions: List.from(state.experiencesOptions),
      destinationsOptions: List.from(state.destinationsOptions),
      ratingOptions: List.from(state.ratingOptions),
    ));
  }

  List<String> getSelectedCategoryOptions() {
    return state.categoryOptions
        .where((option) => option.value)
        .map((option) => option.label)
        .toList();
  }

  List<String> getSelectedStayOptions() {
    return state.stayOptions
        .where((option) => option.value)
        .map((option) => option.label)
        .toList();
  }

  List<String> getSelectedExperiencesOptionsOptions() {
    return state.experiencesOptions
        .where((option) => option.value)
        .map((option) => option.label)
        .toList();
  }

  List<String> getSelectedDestinationsOptions() {
    return state.destinationsOptions
        .where((option) => option.value)
        .map((option) => option.label)
        .toList();
  }
  List<String> getSelectedRatingOptions() {
    return state.ratingOptions
        .where((option) => option.value)
        .map((option) => option.label)
        .toList();
  }
}
