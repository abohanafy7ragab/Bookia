part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLaoding extends BookDetailsState {}

final class BookDetailsError extends BookDetailsState {}

final class BookDetailsSuccess extends BookDetailsState {
  final Data? bookDetails;
  BookDetailsSuccess(this.bookDetails);
}
