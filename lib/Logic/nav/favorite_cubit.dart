import 'package:bloc/bloc.dart';
//import 'package:flutter/material.dart';

class FavoritesCubit extends Cubit<List<String>> {
  FavoritesCubit() : super([]);

  void toggleFavorite(String title) {
    if (state.contains(title)) {
      emit(state.where((item) => item != title).toList());
    } else {
      emit([...state, title]);
    }
  }

  bool isFavorite(String title) {
    return state.contains(title);
  }
}
