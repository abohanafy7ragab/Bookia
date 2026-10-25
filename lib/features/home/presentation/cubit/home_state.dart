part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBestSellerLaoding extends HomeState {}

final class GetBestSellerError extends HomeState {}

final class GetBestSellersuccess extends HomeState {
  List<Products>? products;
  GetBestSellersuccess({required this.products});
}

final class SearchLaoding extends HomeState {}

final class SearchError extends HomeState {}

final class SearchSuccess extends HomeState {
  final List<Products>? products;
  SearchSuccess({required this.products});
}
