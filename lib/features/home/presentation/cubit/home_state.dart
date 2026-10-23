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
