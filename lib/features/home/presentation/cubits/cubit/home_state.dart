part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List mainDetaislList;
  final bool isContainTitle;

  HomeLoadedState({
    required this.mainDetaislList,
    required this.isContainTitle,
  });
}

final class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(
    this.message,
  );
}

final class HomeDetailsLoadedState extends HomeState {
  final List mainDetaislList;
  final bool isContainTitle;

  HomeDetailsLoadedState({
    required this.mainDetaislList,
    required this.isContainTitle,
  });
}
