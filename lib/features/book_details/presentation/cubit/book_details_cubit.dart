import 'package:bloc/bloc.dart';
import 'package:bookia/features/book_details/data/models/books_details_model.dart';
import 'package:bookia/features/book_details/data/repo/book_details_repo.dart';
import 'package:meta/meta.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());

  getDetails(int id) async {
    emit(BookDetailsLaoding());
    final data = await BookDetailsRepo.getBooksDetails(id);
    if (data is BooksDetailsModel) {
      emit(BookDetailsSuccess(data.data));
    } else {
      emit(BookDetailsError());
    }
  }
}
